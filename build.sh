#!/bin/bash

echo "🚀 Building Sentiment Analyzer Full-Stack Application..."

# Build frontend
echo "📦 Building frontend..."
cd frontend
npm install
npm run build
cd ..

echo "✅ Frontend built successfully!"

# Copy frontend build to backend directory
echo "📁 Copying frontend build to backend..."
cp -r frontend/out backend/

echo "🎉 Build complete! Ready for deployment."
echo "Run: cd backend && python main.py"
