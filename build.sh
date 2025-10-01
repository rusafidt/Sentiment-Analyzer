#!/bin/bash

echo "🚀 Building Sentiment Analyzer Single Service..."

# Build frontend
echo "📦 Building frontend..."
cd frontend

# Install dependencies
npm install
if [ $? -ne 0 ]; then
    echo "❌ npm install failed"
    exit 1
fi

# Build the project
npm run build
if [ $? -ne 0 ]; then
    echo "❌ npm run build failed"
    exit 1
fi

cd ..

echo "✅ Frontend built successfully!"

# Copy frontend build to backend directory
echo "📁 Copying frontend build to backend..."
rm -rf backend/frontend-build
cp -r frontend/out backend/frontend-build
if [ $? -ne 0 ]; then
    echo "❌ Failed to copy frontend build"
    exit 1
fi

echo "🎉 Build complete! Ready for deployment."
echo ""
echo "To run the application:"
echo "1. source venv/bin/activate"
echo "2. cd backend"
echo "3. python main.py"
echo ""
echo "Or test the build by running: source venv/bin/activate && cd backend && python main.py"
