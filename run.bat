@echo off
echo 🚀 Starting Sentiment Analyzer with Virtual Environment...

REM Check if virtual environment exists
if not exist "venv\Scripts\activate.bat" (
    echo ❌ Virtual environment not found!
    echo Please run setup.bat first to create the virtual environment.
    pause
    exit /b 1
)

REM Activate virtual environment
echo 🔧 Activating virtual environment...
call venv\Scripts\activate.bat

REM Check if backend directory exists
if not exist "backend\main.py" (
    echo ❌ Backend directory not found!
    pause
    exit /b 1
)

REM Start the backend server
echo 🚀 Starting backend server...
cd backend
python main.py
