@echo off
REM efin AI ROI — One-click Vercel deploy for Windows
echo.
echo ====================================================
echo  efin AI Productivity ^& ROI - Deploy to Vercel
echo ====================================================
echo.

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
  echo [ERROR] Node.js not found. Please install Node.js first.
  echo Download: https://nodejs.org/
  pause
  exit /b 1
)

cd /d "%~dp0"

echo [1/2] Installing Vercel CLI (one-time setup)...
call npm install -g vercel
if %ERRORLEVEL% neq 0 (
  echo [WARN] Global install failed, trying via npx instead.
)

echo.
echo [2/2] Deploying to Vercel production...
echo.
echo If this is the first time, you will be asked to:
echo   1. Login (browser will open)
echo   2. Confirm project settings (just press Enter for defaults)
echo   3. Wait for upload + build (~30 seconds)
echo.
pause

call npx vercel --prod

echo.
echo ====================================================
echo  Deploy finished. Your site URL is shown above.
echo ====================================================
pause
