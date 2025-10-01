# Sentiment Analyzer

A full-stack sentiment analysis application with separate frontend and backend services. Built with Next.js frontend and FastAPI backend.

## 🚀 Features

- **Real-time Sentiment Analysis**: Analyze text sentiment using Naive Bayes classifier
- **Modern Web Interface**: Built with Next.js 14 and Tailwind CSS
- **RESTful API**: FastAPI backend with automatic documentation
- **Machine Learning**: Trained on movie reviews dataset using NLTK and scikit-learn
- **Independent Services**: Frontend and backend can be deployed separately

---

## 🏗️ Architecture

- **Frontend**: Next.js 14 (React/TypeScript)
- **Backend**: FastAPI (Python)
- **ML Library**: scikit-learn with NLTK
- **Styling**: Tailwind CSS with shadcn/ui components

---

## 📁 Project Structure

```
sentiment-analyzer/
├── frontend/               # Next.js frontend
│   ├── app/               # Next.js app directory
│   ├── components/        # React components
│   ├── lib/              # Utility functions
│   ├── package.json      # Node.js dependencies
│   └── next.config.mjs   # Next.js configuration
├── backend/               # FastAPI backend
│   ├── main.py           # FastAPI application
│   ├── requirements.txt  # Python dependencies
│   └── README.md         # Backend documentation
├── venv/                 # Python virtual environment
└── README.md             # This file
```

---

## 🛠️ Local Development

### Prerequisites

- Python 3.11+
- Node.js 18+
- npm or yarn

### Backend Setup

1. **Create and activate virtual environment**:
   ```bash
   python -m venv venv
   
   # Windows
   .\venv\Scripts\Activate.ps1
   
   # Linux/Mac
   source venv/bin/activate
   ```

2. **Install Python dependencies**:
   ```bash
   pip install -r backend/requirements.txt
   ```

3. **Run the backend**:
   ```bash
   python backend/main.py
   ```

   The API will be available at `http://localhost:8000`

### Frontend Setup

1. **Install Node.js dependencies**:
   ```bash
   cd frontend
   npm install
   ```

2. **Run the development server**:
   ```bash
   npm run dev
   ```

   The frontend will be available at `http://localhost:3000`

---

## 📚 API Documentation

Once the backend is running, visit:
- **API Docs**: `http://localhost:8000/docs`
- **ReDoc**: `http://localhost:8000/redoc`

### API Endpoints

- `GET /` - API information
- `GET /api/health` - Health check endpoint
- `POST /api/predict` - Analyze sentiment
- `GET /api/demo` - Demo with sample predictions

### Example API Usage

```bash
# Analyze sentiment
curl -X POST "http://localhost:8000/api/predict" \
     -H "Content-Type: application/json" \
     -d '{"text": "I love this movie!"}'

# Response
{
  "text": "I love this movie!",
  "sentiment": "pos",
  "confidence": 0.85
}
```

---

## 🧪 Testing

### Backend Testing

```bash
# Health check
curl http://localhost:8000/api/health

# Sentiment analysis
curl -X POST "http://localhost:8000/api/predict" \
     -H "Content-Type: application/json" \
     -d '{"text": "This is amazing!"}'
```

### Frontend Testing

Visit `http://localhost:3000` and test the web interface.

---

## 🔧 Development

### Backend Development

- **Framework**: FastAPI
- **ML Libraries**: scikit-learn, NLTK
- **Model**: Naive Bayes classifier trained on movie reviews
- **Features**: Text preprocessing, feature extraction, sentiment prediction

### Frontend Development

- **Framework**: Next.js 14 with App Router
- **Styling**: Tailwind CSS
- **Components**: shadcn/ui component library
- **TypeScript**: Full type safety

---

## 📦 Dependencies

### Backend (Python)
- FastAPI 0.104.1
- Uvicorn 0.24.0
- NLTK 3.9.1
- scikit-learn 1.5.2
- NumPy 2.3.3
- SciPy 1.16.2

### Frontend (Node.js)
- Next.js 14.2.16
- React 18
- TypeScript 5
- Tailwind CSS 3.4.0
- shadcn/ui components

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request


---

## 🚀 Live Demo

**Frontend:** `https://sentiment-analyzer-frontend-hgb5.onrender.com/`

---

## 🙏 Acknowledgments

- Movie reviews dataset from NLTK
- FastAPI for the excellent web framework
- Next.js team for the React framework
- shadcn/ui for the beautiful components