@echo off
echo 🚀 Building Sentiment Analyzer Single Service...

REM Build frontend
echo 📦 Building frontend...
cd frontend
call npm install
if errorlevel 1 (
    echo ❌ npm install failed
    pause
    exit /b 1
)
call npm run build
if errorlevel 1 (
    echo ❌ npm run build failed
    pause
    exit /b 1
)
cd ..

echo ✅ Frontend built successfully!

REM Copy frontend build to backend directory
echo 📁 Copying frontend build to backend...
if exist backend\frontend-build rmdir /S /Q backend\frontend-build
xcopy /E /I /Y frontend\out backend\frontend-build
if errorlevel 1 (
    echo ❌ Failed to copy frontend build
    pause
    exit /b 1
)

echo 🎉 Build complete! Ready for deployment.
echo Run: cd backend && python main.py
pause
