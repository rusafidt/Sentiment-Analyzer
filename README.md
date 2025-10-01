# Sentiment Analyzer

A full-stack sentiment analysis application with separate frontend and backend services. Built with Next.js frontend and FastAPI backend.

## 🚀 Features

- **Real-time Sentiment Analysis**: Analyze text sentiment using Naive Bayes classifier
- **Modern Web Interface**: Built with Next.js 14 and Tailwind CSS
- **RESTful API**: FastAPI backend with automatic documentation
- **Machine Learning**: Trained on movie reviews dataset using NLTK and scikit-learn
- **Separate Services**: Frontend and backend deployed independently

## 🏗️ Architecture

- **Frontend**: Next.js 14 (React/TypeScript)
- **Backend**: FastAPI (Python)
- **ML Library**: scikit-learn with NLTK
- **Styling**: Tailwind CSS with shadcn/ui components
- **Deployment**: Separate Render.com services

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
├── render-backend.yaml   # Backend deployment config
├── render-frontend.yaml  # Frontend deployment config
└── README.md             # This file
```

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

## 🚀 Deployment

### Render.com Deployment (Separate Services)

This project uses **completely separate** frontend and backend services:

#### Backend Service (Deploy First)
- **Service**: `sentiment-analyzer-backend`
- **Type**: Python FastAPI
- **URL**: `https://sentiment-analyzer-backend.onrender.com`
- **Config**: `render-backend.yaml`
- **API**: Public REST API for sentiment analysis

#### Frontend Service (Deploy Second)
- **Service**: `sentiment-analyzer-frontend`
- **Type**: Node.js Next.js
- **URL**: `https://sentiment-analyzer-frontend.onrender.com`
- **Config**: `render-frontend.yaml`
- **Connection**: Calls backend's public API

### Deployment Steps

1. **Deploy Backend First**:
   - Create web service using `render-backend.yaml`
   - Backend provides public API
   - Test: `https://sentiment-analyzer-backend.onrender.com/api/health`

2. **Deploy Frontend**:
   - Create web service using `render-frontend.yaml`
   - Set `BACKEND_URL` environment variable to backend URL
   - Frontend calls backend's public API
   - Test: `https://sentiment-analyzer-frontend.onrender.com`

### Key Points:
- ✅ **Completely Independent Services**
- ✅ **No Shared Resources**
- ✅ **Backend Provides Public API**
- ✅ **Frontend Calls Backend API**
- ✅ **Independent Scaling & Deployment**

## 📚 API Documentation

Once the backend is running, visit:
- **API Docs**: `http://localhost:8000/docs` (local) or `https://your-backend-url.onrender.com/docs`
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

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Movie reviews dataset from NLTK
- FastAPI for the excellent web framework
- Next.js team for the React framework
- shadcn/ui for the beautiful components