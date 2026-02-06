@echo off
setlocal
cd /d "%~dp0"

echo ===== Git Status =====
git status -sb

echo.
echo ===== Files To Be Deployed (public/) =====
dir /b /a:-d public

echo.
echo ===== public/index.html: Firebase Config Check =====
findstr /n /i "FIREBASE_CONFIG" public\index.html

echo.
pause
endlocal
