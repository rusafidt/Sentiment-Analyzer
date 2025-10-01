# Sentiment Analyzer Backend

A FastAPI-based sentiment analysis service that uses Naive Bayes classifier to analyze text sentiment.

## Features

- RESTful API endpoints for sentiment analysis
- Pre-trained model using NLTK movie reviews dataset
- CORS enabled for frontend integration
- Health check endpoints
- Demo endpoint with sample predictions

## Setup

1. **Create virtual environment:**
   ```bash
   python -m venv venv
   ```

2. **Activate virtual environment:**
   - Windows: `venv\Scripts\activate`
   - macOS/Linux: `source venv/bin/activate`

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the server:**
   ```bash
   python main.py
   ```

The API will be available at `http://localhost:8000`

## API Endpoints

- `GET /` - Health check
- `GET /healthz` - Health check endpoint
- `POST /predict` - Analyze sentiment of text
- `GET /demo` - Demo with sample predictions

## API Documentation

Once the server is running, visit:
- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`

## Example Usage

```bash
# Health check
curl http://localhost:8000/

# Analyze sentiment
curl -X POST "http://localhost:8000/predict" \
     -H "Content-Type: application/json" \
     -d '{"text": "I love this movie!"}'

# Demo endpoint
curl http://localhost:8000/demo
```
