#!/bin/bash

echo "🚀 Starting Sentiment Analyzer with Virtual Environment..."

# Check if virtual environment exists
if [ ! -f "venv/bin/activate" ]; then
    echo "❌ Virtual environment not found!"
    echo "Please run setup.sh first to create the virtual environment."
    exit 1
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Check if backend directory exists
if [ ! -f "backend/main.py" ]; then
    echo "❌ Backend directory not found!"
    exit 1
fi

# Start the backend server
echo "🚀 Starting backend server..."
cd backend
python main.py
