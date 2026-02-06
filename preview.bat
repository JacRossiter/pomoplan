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

%FIREBASE_CMD% emulators:start --only hosting
endlocal
