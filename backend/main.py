import nltk
from nltk.corpus import movie_reviews
import random
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Dict
import uvicorn

# Download dataset (only needed first time)
nltk.download('movie_reviews')

# Initialize FastAPI app
app = FastAPI(
    title="Sentiment Analyzer API",
    description="A FastAPI service for sentiment analysis using Naive Bayes",
    version="1.0.0"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://127.0.0.1:3000"],  # React dev server
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Global variables for model and vectorizer
model = None
vectorizer = None

# Pydantic models for request/response
class TextInput(BaseModel):
    text: str

class SentimentResponse(BaseModel):
    text: str
    sentiment: str
    confidence: float

class HealthResponse(BaseModel):
    status: str
    message: str

def train_model():
    """Train the sentiment analysis model"""
    global model, vectorizer
    
    print("Training sentiment analysis model...")
    
    # Load documents with labels
    documents = [
        (list(movie_reviews.words(fileid)), category)
        for category in movie_reviews.categories()
        for fileid in movie_reviews.fileids(category)
    ]
    random.shuffle(documents)

    # Split into texts and labels
    texts = [" ".join(words) for words, label in documents]
    labels = [label for words, label in documents]

    # Convert text to feature vectors
    vectorizer = CountVectorizer(stop_words="english", max_features=3000)
    X = vectorizer.fit_transform(texts)

    # Train Naive Bayes model
    model = MultinomialNB()
    model.fit(X, labels)
    
    print("Model training completed!")

def predict_sentiment(text: str) -> Dict[str, any]:
    """Predict sentiment of input text"""
    if model is None or vectorizer is None:
        raise ValueError("Model not trained yet")
    
    X_test = vectorizer.transform([text])
    prediction = model.predict(X_test)[0]
    confidence = model.predict_proba(X_test)[0].max()
    
    return {
        "sentiment": prediction,
        "confidence": float(confidence)
    }

@app.on_event("startup")
async def startup_event():
    """Initialize the model when the app starts"""
    train_model()

@app.get("/", response_model=HealthResponse)
async def root():
    """Root endpoint - health check"""
    return HealthResponse(
        status="healthy",
        message="Sentiment Analyzer API is running!"
    )

@app.get("/healthz", response_model=HealthResponse)
async def health_check():
    """Health check endpoint"""
    return HealthResponse(
        status="healthy",
        message="API is ready to analyze sentiment"
    )

@app.post("/predict", response_model=SentimentResponse)
async def analyze_sentiment(input_data: TextInput):
    """Analyze sentiment of input text"""
    try:
        result = predict_sentiment(input_data.text)
        return SentimentResponse(
            text=input_data.text,
            sentiment=result["sentiment"],
            confidence=result["confidence"]
        )
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/demo")
async def demo():
    """Demo endpoint with sample predictions"""
    samples = [
        "I really loved this movie, it was amazing!",
        "It was boring and too long.",
        "The acting was okay, nothing special."
    ]
    
    results = []
    for text in samples:
        result = predict_sentiment(text)
        results.append({
            "text": text,
            "sentiment": result["sentiment"],
            "confidence": result["confidence"]
        })
    
    return {"demo_results": results}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
