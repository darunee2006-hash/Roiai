@echo off
setlocal
chcp 65001 > nul
REM efin AI ROI - Quick update + push (ใช้หลัง setup-github.bat ครั้งแรก)

cd /d "%~dp0"

echo.
echo ====================================================
echo  efin AI ROI - Update + Push
echo ====================================================
echo.

set /p MSG=Commit message (Enter เพื่อใช้ "update"):
if "%MSG%"=="" set MSG=update

git add -A
git commit -m "%MSG%"
git push

echo.
echo ====================================================
echo  ✅ Push เสร็จ — Vercel กำลัง auto-deploy
echo  เปิด https://vercel.com/dashboard ดู progress
echo ====================================================
pause
