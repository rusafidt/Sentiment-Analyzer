# 🎭 Sentiment Analyzer  

A full-stack sentiment analysis application with FastAPI backend and Next.js frontend. Classifies text sentiment into **Positive/Negative** using **scikit-learn** and **NLTK**.

## 📁 Project Structure

```
Sentiment Analyzer/
├── backend/           # FastAPI backend
│   ├── main.py       # Main application file
│   ├── requirements.txt
│   └── README.md
├── frontend/          # Next.js frontend
│   ├── app/          # Next.js app directory
│   │   ├── api/      # API routes
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── components/   # React components
│   │   ├── ui/       # UI components (Radix UI)
│   │   └── theme-provider.tsx
│   ├── lib/          # Utilities
│   ├── hooks/        # Custom React hooks
│   ├── public/       # Static assets
│   ├── package.json
│   └── README.md
├── venv/             # Python virtual environment
├── .gitignore        # Git ignore rules
└── README.md         # This file
```

## 🛠️ Technology Stack

### Backend
- **FastAPI** - Modern, fast web framework for building APIs
- **Python 3.8+** - Programming language
- **NLTK** - Natural Language Toolkit for text processing
- **scikit-learn** - Machine learning library (Naive Bayes)
- **uvicorn** - ASGI server for FastAPI

### Frontend
- **Next.js 14** - React framework with App Router
- **TypeScript** - Type-safe JavaScript
- **Tailwind CSS** - Utility-first CSS framework
- **Radix UI** - Accessible UI component library
- **Lucide React** - Beautiful icons
- **React Hook Form** - Form handling
- **Zod** - Schema validation

### Development Tools
- **ESLint** - Code linting
- **Prettier** - Code formatting
- **PostCSS** - CSS processing  

---

## 🚀 Features

### Backend (FastAPI)
- **FastAPI REST API** with automatic documentation
- **Naive Bayes** model trained on NLTK movie reviews dataset  
- **Real-time sentiment analysis** with confidence scores
- **Interactive API docs** at `/docs`
- **Health check endpoints** for monitoring
- **CORS enabled** for frontend integration

### Frontend (Next.js)
- **Modern React UI** with Next.js 14 and TypeScript
- **Beautiful design** using Radix UI components and Tailwind CSS
- **Real-time sentiment analysis** with live results
- **Responsive design** that works on all devices
- **Dark theme** with smooth animations
- **API integration** with backend sentiment analysis

---

## ⚙️ Quick Start

### Prerequisites
- **Python 3.8+** (for backend)
- **Node.js 18+** (for frontend)
- **npm** or **pnpm** (package manager)

> **🚀 Single Service Deployment**: This project deploys as a single service with both backend and frontend combined! See [NON_DOCKER_DEPLOYMENT.md](NON_DOCKER_DEPLOYMENT.md) for details.

### Backend Setup

1. **Navigate to backend directory:**
   ```bash
   cd backend
   ```

2. **Create and activate virtual environment:**
   ```bash
   python -m venv venv
   # Windows:
   venv\Scripts\activate
   # macOS/Linux:
   source venv/bin/activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run the backend server:**
   ```bash
   python main.py
   ```

The API will be available at `http://localhost:8000`

### Frontend Setup

1. **Navigate to frontend directory:**
   ```bash
   cd frontend
   ```

2. **Install dependencies:**
   ```bash
   npm install
   # or
   pnpm install
   ```

3. **Create environment file:**
   Create a `.env.local` file in the frontend directory:
   ```
   API_BASE_URL=http://localhost:8000
   ```

4. **Start development server:**
   ```bash
   npm run dev
   # or
   pnpm dev
   ```

The frontend will run on `http://localhost:3000`

### Running Both Services

**Terminal 1 (Backend):**
```bash
cd backend
python main.py
```

**Terminal 2 (Frontend):**
```bash
cd frontend
npm run dev
```

Visit `http://localhost:3000` to use the application!

## 🌐 **Production Deployment**

For production deployment, we use a **single service** for maximum simplicity:

- **Single Service**: Python Web Service on Render
- **Frontend**: Served from same service
- **Backend API**: `/api/*` endpoints
- **One URL**: Everything at one URL!

See [NON_DOCKER_DEPLOYMENT.md](NON_DOCKER_DEPLOYMENT.md) for complete deployment instructions.

---

## 📡 API Endpoints

### 🔍 **POST** `/api/predict`
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

### 🏥 **GET** `/api/health`
Health check endpoint

### 🎯 **GET** `/api/demo`
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
curl -X POST "http://localhost:8000/api/predict" \
     -H "Content-Type: application/json" \
     -d '{"text": "This movie is terrible and boring"}'

# Health check
curl "http://localhost:8000/api/health"

# Demo
curl "http://localhost:8000/api/demo"
```

### Using Python requests:
```python
import requests

# Predict sentiment
response = requests.post(
    "http://localhost:8000/api/predict",
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

## 🚀 Development

### Backend Development
```bash
cd backend
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt
python main.py
```

### Frontend Development
```bash
cd frontend
npm install
npm run dev
```

### Building for Production

**Backend:**
```bash
cd backend
pip install -r requirements.txt
python main.py
```

**Frontend:**
```bash
cd frontend
npm run build
npm start
```

## 🐳 Deployment

### Docker (Recommended)
```bash
# Build and run with Docker Compose
docker-compose up --build
```

### Manual Deployment
1. **Backend:** Deploy to any Python hosting (Heroku, Railway, DigitalOcean)
2. **Frontend:** Deploy to Vercel, Netlify, or any static hosting

### Environment Variables
- **Backend:** No additional environment variables needed
- **Frontend:** Set `API_BASE_URL` to your deployed backend URL

## 🔧 Troubleshooting

### Common Issues

**Backend won't start:**
- Ensure Python 3.8+ is installed
- Activate virtual environment before running
- Check if port 8000 is available

**Frontend can't connect to backend:**
- Verify backend is running on port 8000
- Check `.env.local` file has correct `API_BASE_URL`
- Ensure CORS is properly configured

**NLTK data download issues:**
- The model automatically downloads NLTK data on first run
- Ensure internet connection is available

### Performance Tips
- Backend model loads on startup (takes ~30 seconds)
- Consider caching model for production
- Use PM2 for backend process management

## 📊 API Response Format

```json
{
  "text": "I love this movie!",
  "sentiment": "pos",
  "confidence": 0.85
}
```

- `sentiment`: "pos" (positive) or "neg" (negative)
- `confidence`: Float between 0.0 and 1.0

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test both backend and frontend
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

### 🔮 Future Improvements
- Add transformers (BERT) version for modern sentiment analysis  
- Add neutral sentiment category
- Implement batch processing endpoint
- Add user authentication and history
- Deploy to cloud platform with CI/CD
- Add real-time sentiment monitoring dashboard
- Implement sentiment analysis for multiple languages  
