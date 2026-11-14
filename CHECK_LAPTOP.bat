@echo off
echo === Node ===
node --version
echo === Java ===
java -version
echo === Ollama models ===
ollama list
echo === RAM ===
powershell -Command "Get-CimInstance Win32_ComputerSystem | Select-Object @{n='TotalRAM_GB';e={[math]::Round($_.TotalPhysicalMemory/1GB,1)}}"
pause
