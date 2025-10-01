# Deployment Guide - Separate Services

## 🚀 Render.com Deployment Steps

### Step 1: Deploy Backend First

1. **Go to [render.com](https://render.com)**
2. **Create New Web Service**
3. **Connect GitHub Repository**
4. **Configure Backend Service**:
   - **Name**: `sentiment-analyzer-backend`
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r backend/requirements.txt`
   - **Start Command**: `cd backend && python main.py`
   - **Python Version**: `3.11.0`

5. **Deploy Backend**
   - Backend will be available at: `https://sentiment-analyzer-backend.onrender.com`
   - Test: `https://sentiment-analyzer-backend.onrender.com/api/health`

### Step 2: Deploy Frontend

1. **Create Another Web Service**
2. **Configure Frontend Service**:
   - **Name**: `sentiment-analyzer-frontend`
   - **Environment**: `Node.js`
   - **Build Command**: `cd frontend && npm install && npm run build`
   - **Start Command**: `cd frontend && npm start`
   - **Node Version**: `18.17.0`

3. **Set Environment Variable**:
   - **Key**: `BACKEND_URL`
   - **Value**: `https://sentiment-analyzer-backend.onrender.com`

4. **Deploy Frontend**
   - Frontend will be available at: `https://sentiment-analyzer-frontend.onrender.com`

## 🔗 How They Connect

- **Frontend** calls **Backend's Public API**
- **No shared resources** between services
- **Independent scaling** and deployment
- **Backend URL** configured via environment variable

## 📋 Deployment Checklist

### Backend Deployment:
- [ ] Backend service created on Render
- [ ] Python dependencies installed
- [ ] API responding at `/api/health`
- [ ] Sentiment analysis working at `/api/predict`
- [ ] Backend URL noted for frontend config

### Frontend Deployment:
- [ ] Frontend service created on Render
- [ ] Node.js dependencies installed
- [ ] Build completed successfully
- [ ] `BACKEND_URL` environment variable set
- [ ] Frontend calling backend API correctly

## 🧪 Testing After Deployment

### Test Backend:
```bash
curl https://sentiment-analyzer-backend.onrender.com/api/health
curl -X POST https://sentiment-analyzer-backend.onrender.com/api/predict \
     -H "Content-Type: application/json" \
     -d '{"text": "I love this movie!"}'
```

### Test Frontend:
- Visit: `https://sentiment-analyzer-frontend.onrender.com`
- Enter text and test sentiment analysis
- Check browser network tab to see API calls to backend

## 🔧 Troubleshooting

### Backend Issues:
- Check build logs for Python dependency errors
- Verify `/api/health` endpoint is responding
- Check Python version compatibility

### Frontend Issues:
- Check build logs for Node.js dependency errors
- Verify `BACKEND_URL` environment variable is set correctly
- Check browser console for API connection errors
- **Common Issue**: If you see "Missing script: buildn" error, it's a Render caching issue
  - Solution: Clear Render cache or redeploy
  - Alternative: Use manual build command: `cd frontend && npm install && npm run build`

### Connection Issues:
- Ensure backend is deployed and running first
- Verify backend URL in frontend environment variables
- Check CORS settings if needed
