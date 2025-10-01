# 🚀 Single Service Deployment Guide

Deploy your **Sentiment Analyzer** as a **single service** on Render with both backend and frontend combined!

## 🎯 What This Achieves

- ✅ **Single URL** for your entire application
- ✅ **Backend API** served at `/api/*` endpoints
- ✅ **Frontend UI** served at the root `/`
- ✅ **Automatic routing** for frontend pages
- ✅ **Simplified deployment** - one service, one URL

## 📋 Prerequisites

- GitHub account
- Render account (free tier available)
- Git installed locally

## 🔧 Pre-Deployment Setup

### 1. Test Locally First
```bash
# Build the full-stack application
# On Windows:
build.bat

# On macOS/Linux:
chmod +x build.sh
./build.sh

# Start the combined service
cd backend
python main.py
```

Visit `http://localhost:8000` - you should see both:
- Frontend UI at the root
- API docs at `http://localhost:8000/docs`

### 2. Verify API Endpoints
- `GET /` - Frontend UI
- `GET /api/health` - Health check
- `POST /api/predict` - Sentiment analysis
- `GET /api/demo` - Demo predictions
- `GET /docs` - API documentation

## 🐙 GitHub Deployment

### 1. Initialize Git Repository
```bash
# In your project root
git init
git add .
git commit -m "Initial commit: Full-stack sentiment analyzer - single service"
```

### 2. Create GitHub Repository
1. Go to GitHub.com and create a new repository
2. Name it `sentiment-analyzer` or similar
3. Don't initialize with README (we already have one)

### 3. Push to GitHub
```bash
git remote add origin https://github.com/YOUR_USERNAME/sentiment-analyzer.git
git branch -M main
git push -u origin main
```

## 🌐 Render Deployment (Single Service)

### 1. Connect GitHub Repository
1. Go to [Render Dashboard](https://dashboard.render.com)
2. Click "New" → "Web Service"
3. Connect your GitHub repository

### 2. Configure Single Service
- **Name**: `sentiment-analyzer`
- **Environment**: `Docker`
- **Dockerfile Path**: `./Dockerfile`
- **Root Directory**: Leave empty (uses root)

### 3. Environment Variables (Optional)
- No additional environment variables needed
- The service will automatically build both frontend and backend

### 4. Deploy
- Click "Create Web Service"
- Wait for deployment (first build takes ~10-15 minutes)

## 🎉 What You Get

### Single URL Application
- **Main App**: `https://your-app-url.onrender.com`
- **API Docs**: `https://your-app-url.onrender.com/docs`
- **Health Check**: `https://your-app-url.onrender.com/api/health`

### API Endpoints
```bash
# Health check
curl https://your-app-url.onrender.com/api/health

# Sentiment analysis
curl -X POST https://your-app-url.onrender.com/api/predict \
  -H "Content-Type: application/json" \
  -d '{"text": "I love this movie!"}'

# Demo predictions
curl https://your-app-url.onrender.com/api/demo
```

### Frontend Features
- Beautiful dark theme UI
- Real-time sentiment analysis
- Responsive design
- Direct API integration (no CORS issues)

## 🔧 How It Works

### Architecture
```
┌─────────────────────────────────────┐
│           Render Service            │
├─────────────────────────────────────┤
│  FastAPI Backend (Port 8000)       │
│  ├── /api/* → Backend endpoints    │
│  ├── /docs → API documentation     │
│  ├── / → Frontend UI               │
│  └── /* → Frontend routing         │
└─────────────────────────────────────┘
```

### Build Process
1. **Frontend Build**: Next.js builds static files to `frontend/out/`
2. **Docker Build**: Multi-stage Docker build combines both
3. **Backend Serves**: FastAPI serves frontend files + API endpoints

### File Structure in Production
```
/app/
├── main.py                 # FastAPI backend
├── requirements.txt        # Python dependencies
├── frontend/out/          # Built frontend files
│   ├── index.html         # Main UI
│   ├── _next/static/      # Static assets
│   └── assets/            # Additional assets
└── ...
```

## 🧪 Testing Your Deployment

### 1. Frontend Test
- Visit your Render URL
- Enter text and click "Analyze Sentiment"
- Verify it works end-to-end

### 2. API Test
```bash
# Test health endpoint
curl https://your-app-url.onrender.com/api/health

# Test sentiment analysis
curl -X POST https://your-app-url.onrender.com/api/predict \
  -H "Content-Type: application/json" \
  -d '{"text": "This is amazing!"}'
```

### 3. API Documentation
- Visit `https://your-app-url.onrender.com/docs`
- Test the API directly from the Swagger UI

## 🔄 Updates and Maintenance

### Updating Your App
1. Make changes to your code
2. Commit and push to GitHub
3. Render automatically redeploys

### Monitoring
- Check Render dashboard for deployment status
- Monitor logs for any errors
- Check API health endpoint regularly

## 🚨 Troubleshooting

### Build Issues
- **Frontend build fails**: Check Node.js version compatibility
- **Python build fails**: Verify requirements.txt syntax
- **Docker build fails**: Check Dockerfile syntax

### Runtime Issues
- **Frontend not loading**: Check if static files are properly copied
- **API not working**: Check backend logs in Render dashboard
- **CORS errors**: Not applicable (same origin)

### Performance
- **Slow cold starts**: Normal for free tier (~30 seconds)
- **Memory usage**: Monitor in Render dashboard
- **Model loading**: First API call may be slow

## 🎯 Benefits of Single Service

### ✅ Advantages
- **Simpler deployment** - one service to manage
- **No CORS issues** - same origin for frontend and API
- **Cost effective** - only one service on free tier
- **Easier maintenance** - single deployment pipeline
- **Better performance** - no network calls between services

### 📊 Resource Usage
- **Memory**: ~800MB (backend + frontend)
- **CPU**: Efficient for sentiment analysis
- **Storage**: Minimal (just built files)
- **Network**: Optimized internal routing

## 🎉 Success!

Your Sentiment Analyzer is now deployed as a single service with:
- ✅ Beautiful frontend UI
- ✅ Powerful backend API
- ✅ Automatic documentation
- ✅ Production-ready performance

**Single URL for everything!** 🚀
