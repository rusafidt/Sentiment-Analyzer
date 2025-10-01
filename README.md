# 🎭 Sentiment Analyzer API  

A FastAPI web service that classifies text sentiment into **Positive/Negative** using **scikit-learn** and **NLTK**.  

---

## 🚀 Features
- **FastAPI REST API** with automatic documentation
- **Naive Bayes** model trained on NLTK movie reviews dataset  
- **Real-time sentiment analysis** with confidence scores
- **Interactive API docs** at `/docs`
- **Health check endpoints** for monitoring

---

## ⚙️ Setup

### 1. Install dependencies
```bash
pip install -r requirements.txt
```

### 2. Run the API server
```bash
python main.py
```

The API will be available at: `http://localhost:8000`

---

## 📡 API Endpoints

### 🔍 **POST** `/predict`
Analyze sentiment of input text

**Request:**
```json
{
  "text": "I really loved this movie, it was amazing!"
}
```

**Response:**
```json
{
  "text": "I really loved this movie, it was amazing!",
  "sentiment": "pos",
  "confidence": 0.85
}
```

### 🏥 **GET** `/health`
Health check endpoint

### 🎯 **GET** `/demo`
Demo endpoint with sample predictions

### 📚 **GET** `/docs`
Interactive API documentation (Swagger UI)

### 📖 **GET** `/redoc`
Alternative API documentation

---

## 🧪 Usage Examples

### Using curl:
```bash
# Predict sentiment
curl -X POST "http://localhost:8000/predict" \
     -H "Content-Type: application/json" \
     -d '{"text": "This movie is terrible and boring"}'

# Health check
curl "http://localhost:8000/health"

# Demo
curl "http://localhost:8000/demo"
```

### Using Python requests:
```python
import requests

# Predict sentiment
response = requests.post(
    "http://localhost:8000/predict",
    json={"text": "I love this movie!"}
)
result = response.json()
print(f"Sentiment: {result['sentiment']}, Confidence: {result['confidence']}")
```

---

## 📝 Example Output
```json
{
  "demo_results": [
    {
      "text": "I really loved this movie, it was amazing!",
      "sentiment": "pos",
      "confidence": 0.92
    },
    {
      "text": "It was boring and too long.",
      "sentiment": "neg", 
      "confidence": 0.88
    }
  ]
}
```

---

### 🔮 Future Improvements
- Add transformers (BERT) version for modern sentiment analysis  
- Add neutral sentiment category
- Build a Streamlit web app frontend
- Add batch processing endpoint
- Implement model caching and optimization  
