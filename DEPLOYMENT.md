# 🚀 Deployment Guide

This guide will help you deploy your Sentiment Analyzer application to GitHub and Render.

## 📋 Prerequisites

- GitHub account
- Render account (free tier available)
- Git installed locally

## 🔧 Pre-Deployment Checklist

### ✅ Backend Ready
- [x] FastAPI application with CORS enabled
- [x] Host set to `0.0.0.0` for production
- [x] Requirements.txt with all dependencies
- [x] Dockerfile for containerization

### ✅ Frontend Ready
- [x] Next.js application with API integration
- [x] Environment variable configuration
- [x] Production build configuration
- [x] Dockerfile for containerization

### ✅ Project Structure
- [x] Proper .gitignore for both Python and Node.js
- [x] Comprehensive README.md
- [x] Docker Compose for local development

## 🐙 GitHub Deployment

### 1. Initialize Git Repository
```bash
# In your project root
git init
git add .
git commit -m "Initial commit: Full-stack sentiment analyzer"
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

## 🌐 Render Deployment

### Backend Deployment

1. **Connect GitHub Repository**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New" → "Web Service"
   - Connect your GitHub repository

2. **Configure Backend Service**
   - **Name**: `sentiment-analyzer-backend`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r backend/requirements.txt`
   - **Start Command**: `cd backend && python main.py`
   - **Root Directory**: Leave empty (or set to `backend/`)

3. **Environment Variables**
   - No additional environment variables needed for backend

4. **Deploy**
   - Click "Create Web Service"
   - Wait for deployment (first build takes ~5-10 minutes)

### Frontend Deployment

1. **Create New Web Service**
   - Click "New" → "Static Site"
   - Connect the same GitHub repository

2. **Configure Frontend Service**
   - **Name**: `sentiment-analyzer-frontend`
   - **Root Directory**: `frontend`
   - **Build Command**: `npm install && npm run build`
   - **Publish Directory**: `frontend/out`

3. **Environment Variables**
   - Add: `API_BASE_URL` = `https://your-backend-url.onrender.com`

4. **Deploy**
   - Click "Create Static Site"
   - Wait for deployment

## 🔗 Update Frontend API URL

After backend deployment:

1. Copy your backend URL from Render dashboard
2. Update frontend environment variable in Render:
   - Go to frontend service settings
   - Update `API_BASE_URL` to your backend URL
3. Redeploy frontend

## 🧪 Test Deployment

### Backend Testing
```bash
curl https://your-backend-url.onrender.com/
curl -X POST https://your-backend-url.onrender.com/predict \
  -H "Content-Type: application/json" \
  -d '{"text": "I love this movie!"}'
```

### Frontend Testing
- Visit your frontend URL
- Enter some text and test sentiment analysis
- Verify it connects to backend successfully

## 📊 Render Configuration Files

### Backend render.yaml
```yaml
services:
  - type: web
    name: sentiment-analyzer-backend
    env: python
    buildCommand: pip install -r backend/requirements.txt
    startCommand: cd backend && python main.py
```

### Frontend render.yaml
```yaml
services:
  - type: web
    name: sentiment-analyzer-frontend
    env: static
    buildCommand: cd frontend && npm install && npm run build
    staticPublishPath: ./frontend/out
    envVars:
      - key: API_BASE_URL
        value: https://your-backend-url.onrender.com
```

## 🔧 Troubleshooting

### Backend Issues
- **Build fails**: Check requirements.txt syntax
- **Runtime errors**: Check Python version compatibility
- **CORS errors**: Verify CORS middleware configuration

### Frontend Issues
- **Build fails**: Check Node.js version and dependencies
- **API connection fails**: Verify API_BASE_URL environment variable
- **Static files not loading**: Check publish directory path

### Performance Optimization
- **Cold starts**: Consider upgrading to paid plan for faster cold starts
- **Memory usage**: Monitor resource usage in Render dashboard
- **Model loading**: First request may be slow due to model initialization

## 🎯 Production URLs

After successful deployment:
- **Backend API**: `https://your-backend-url.onrender.com`
- **Frontend**: `https://your-frontend-url.onrender.com`
- **API Docs**: `https://your-backend-url.onrender.com/docs`

## 📈 Monitoring

- Monitor deployments in Render dashboard
- Check logs for any errors
- Set up health checks for backend service
- Monitor API usage and performance

## 🔄 Updates and Maintenance

### Updating Backend
1. Make changes to backend code
2. Commit and push to GitHub
3. Render automatically redeploys

### Updating Frontend
1. Make changes to frontend code
2. Commit and push to GitHub
3. Render automatically redeploys

### Environment Variables
- Update in Render dashboard when needed
- No code changes required for env var updates

Your Sentiment Analyzer is now ready for production deployment! 🎉
