@echo off
echo IMPORTANT: First open Minecraft 1.21.6, enter your world, Esc - Open to LAN - Start LAN World.
echo Then come back here and press a key.
pause
node --version
echo If Node shows v24, STOP and use Node 20 or 22 LTS for Mindcraft (see README Step 2).
echo Starting Chinnu bot (offline, Ollama)...
node main.js
pause
