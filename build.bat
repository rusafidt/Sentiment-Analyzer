@echo off
echo 🚀 Building Sentiment Analyzer Full-Stack Application...

REM Build frontend
echo 📦 Building frontend...
cd frontend
call npm install
call npm run build
cd ..

echo ✅ Frontend built successfully!

REM Copy frontend build to backend directory
echo 📁 Copying frontend build to backend...
xcopy /E /I /Y frontend\out backend\out

echo 🎉 Build complete! Ready for deployment.
echo Run: cd backend && python main.py
pause
