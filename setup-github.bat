@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
REM efin AI ROI - One-click GitHub setup + push
REM ดับเบิลคลิกแล้วทำตามคำถามได้เลย

echo.
echo ====================================================
echo  efin AI ROI - GitHub Setup
echo ====================================================
echo.

cd /d "%~dp0"

REM ---- Check git ----
where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
  echo [ERROR] ไม่พบ Git บนเครื่อง
  echo ติดตั้งก่อน: https://git-scm.com/downloads
  pause
  exit /b 1
)

echo [1/6] Git พร้อมใช้งาน
git --version
echo.

REM ---- Ask user for repo URL ----
echo ====================================================
echo  ขั้นตอนที่ 1: สร้าง GitHub repo
echo ====================================================
echo.
echo  1. เปิดเบราว์เซอร์ไปที่: https://github.com/new
echo  2. Repository name: efin-ai-roi
echo  3. ติ๊ก Private (แนะนำ)
echo  4. อย่าติ๊ก "Add README" "Add .gitignore" "Add license"
echo  5. กด Create repository
echo  6. Copy URL ที่ได้ (จะมีรูปแบบ: https://github.com/USERNAME/efin-ai-roi.git)
echo.
set /p REPO_URL=วาง URL ตรงนี้:

if "%REPO_URL%"=="" (
  echo [ERROR] ไม่ได้ใส่ URL
  pause
  exit /b 1
)

echo.
echo [2/6] ตั้งค่า Git config
git config user.email "efinaihr@gmail.com"
git config user.name "hrefin"

echo.
echo [3/6] git init
if exist .git (
  echo .git มีอยู่แล้ว ข้ามขั้นนี้
) else (
  git init -b main
)

echo.
echo [4/6] git add + commit
git add -A
git commit -m "Initial: efin AI Productivity & ROI Evaluation Framework" 2>nul
if %ERRORLEVEL% neq 0 (
  echo มี commit อยู่แล้ว — ข้าม
)

echo.
echo [5/6] เชื่อม GitHub remote
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git branch -M main

echo.
echo [6/6] Push ขึ้น GitHub
echo.
echo ถ้า GitHub ถามรหัสผ่าน:
echo   Username = GitHub username ของคุณ
echo   Password = Personal Access Token (PAT)
echo.
echo สร้าง PAT ได้ที่: https://github.com/settings/tokens
echo เลือก scope: repo (ทุก checkbox ใต้ repo)
echo.
pause

git push -u origin main

if %ERRORLEVEL% neq 0 (
  echo.
  echo [ERROR] Push ล้มเหลว — ลองอีกครั้งหรือเช็ค URL กับ token
  pause
  exit /b 1
)

echo.
echo ====================================================
echo  ✅ Push สำเร็จ!
echo ====================================================
echo.
echo  ขั้นตอนถัดไป (ตั้ง Vercel auto-deploy):
echo.
echo  1. เปิด: https://vercel.com/new
echo  2. Login ด้วย GitHub
echo  3. หา repo "efin-ai-roi" — กด Import
echo  4. ใช้ค่า default ทุกช่อง — กด Deploy
echo  5. รอ 20 วินาที → ได้ URL
echo.
echo  หลังจากนี้ทุกครั้งที่ดับเบิลคลิก update.bat
echo  หรือ git push — Vercel deploy ใหม่อัตโนมัติ
echo.
pause
