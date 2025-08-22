import nltk
from nltk.corpus import movie_reviews
import random
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.naive_bayes import MultinomialNB

# Download dataset (only needed first time)
nltk.download('movie_reviews')

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

# Predict sentiment of new text
def predict_sentiment(text: str) -> str:
    X_test = vectorizer.transform([text])
    return model.predict(X_test)[0]

# Demo run
if __name__ == "__main__":
    samples = [
        "I really loved this movie, it was amazing!",
        "It was boring and too long.",
        "The acting was okay, nothing special."
    ]
    for s in samples:
        print(f"{s} → {predict_sentiment(s)}")
