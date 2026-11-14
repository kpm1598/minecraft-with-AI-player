@echo off
echo Pulling ONLY the lite models for your 8GB laptop...
echo Model 1 of 2: Andy-4 micro (1.5B, Minecraft-tuned, ~1.6 GB download)
ollama pull sweaterdog/andy-4:micro-q8_0
echo Model 2 of 2: embeddinggemma (small, for bot memory/search)
ollama pull embeddinggemma
echo.
echo Done. Run: ollama list  - you should see both models.
pause
