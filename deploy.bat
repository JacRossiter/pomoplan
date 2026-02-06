@echo off
setlocal
cd /d "%~dp0"

set "PATH=C:\Program Files\nodejs;%PATH%"

where /q firebase
if %errorlevel% neq 0 (
  if exist "%AppData%\npm\firebase.cmd" (
    set "FIREBASE_CMD=%AppData%\npm\firebase.cmd"
  ) else if exist "%ProgramFiles%\nodejs\firebase.cmd" (
    set "FIREBASE_CMD=%ProgramFiles%\nodejs\firebase.cmd"
  ) else (
    echo.
    echo Firebase CLI not found. Install it with:
    echo   npm install -g firebase-tools
    pause
    exit /b 1
  )
) else (
  set "FIREBASE_CMD=firebase"
)

for /f "delims=" %%g in ('git status --porcelain') do set DIRTY=1
if defined DIRTY (
  echo.
  echo WARNING: You have uncommitted changes.
  echo Deploying will publish them.
  echo.
  choice /m "Continue with deploy?"
  if errorlevel 2 exit /b 1
)

%FIREBASE_CMD% deploy --only hosting
if %errorlevel% neq 0 (
  echo.
  echo Deploy failed.
  pause
  exit /b %errorlevel%
)
start https://pomoplan-9043b.web.app
endlocal
