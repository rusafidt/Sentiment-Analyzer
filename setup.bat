@echo off
echo 🚀 Setting up Sentiment Analyzer...

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed. Please install Python 3.11+ first.
    pause
    exit /b 1
)

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js is not installed. Please install Node.js 18+ first.
    pause
    exit /b 1
)

REM Create virtual environment
echo 📦 Creating virtual environment...
python -m venv venv

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Install Python dependencies
echo 📚 Installing Python dependencies...
pip install -r backend\requirements.txt

REM Install Node.js dependencies
echo 📦 Installing Node.js dependencies...
cd frontend
call npm install
cd ..

echo ✅ Setup complete!
echo.
echo To run the application:
echo 1. Activate virtual environment: venv\Scripts\activate.bat
echo 2. Run backend: cd backend ^&^& python main.py
echo 3. Run frontend: cd frontend ^&^& npm run dev
echo.
echo Or use the build script: build.bat
pause
