@echo off
REM v2: use portable Node 22 from Downloads if present (Node 24 untouched)
if exist "%USERPROFILE%\Downloads\node-v22.22.0-win-x64\node.exe" set "PATH=%USERPROFILE%\Downloads\node-v22.22.0-win-x64;%PATH%"
echo Node version in this window:
node --version
echo If it shows v24, STOP - portable Node 22 not found in Downloads (see README Step 2).
echo.
echo IMPORTANT: First open Minecraft 1.21.6, enter your world, Esc - Open to LAN - Start LAN World.
echo Then come back here and press a key.
pause
echo Starting Chinnu bot (offline, Ollama)...
node main.js
pause
