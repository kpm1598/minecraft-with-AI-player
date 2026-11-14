# Minecraft AI — 100% Offline (Ollama Lite) — for Kasim's laptop

Bot name in game: **Chinnu**
AI: **Ollama only. No API key, no internet needed after the one-time downloads, ₹0.**
Framework: Mindcraft (official `profiles/andy-4.json` uses exactly this model setup).

## Your laptop reality — read this first

Your laptop: **i5-1035G1, 8 GB RAM, Intel UHD (no dedicated GPU), Windows.**

That means:
- ❌ Full Andy-4 (8B) will NOT work — it needs 6–8 GB *just for the model*.
- ✅ **Andy-4 micro (1.5B)** is the only Andy model that fits. This pack uses only that.
- ⚠️ Replies will be **slow: roughly 10–30 seconds** on CPU. This is normal, not a bug.
- ⚠️ Bot is good at simple jobs (follow, come, collect wood/stone, craft basic items).
  Complex builds / long plans will often fail on the micro model. That is a model-size limit, not a setup mistake.

### RAM budget (why this pack is tuned this way)

| Thing | Approx RAM |
|---|---|
| Windows + background | ~3.0 GB |
| Minecraft client (tuned, see Step 5) | ~2.0 GB |
| Ollama — Andy-4 micro | ~1.3–1.6 GB |
| Mindcraft (Node) | ~0.3 GB |
| **Total** | **~6.6–6.9 GB of 8 GB — tight but workable** |

**No separate Paper server in v1** — on purpose. A Paper server would add ~1.5 GB and push you over.
Instead you use your singleplayer world + **Open to LAN** (the integrated server is already inside your game, ₹0 extra RAM).
Close Chrome, Aarohi backend, and other heavy apps before playing.

---

## What you copy where

This pack does NOT contain Mindcraft itself. You clone Mindcraft (Step 3), then copy
`andy.json`, `settings.js`, `keys.json` from this pack **into the mindcraft folder**, replacing its files.
The `.bat` files also go into the mindcraft folder.

Final folder on your laptop:
`C:\Users\patel\Downloads\mindcraft\`  ← andy.json, settings.js, keys.json, 01_PULL_MODELS.bat, 02_START_BOT.bat all here, next to `main.js`

---

## Step 1 — Ollama (you already have it for Aarohi)

Open PowerShell and check:

```powershell
ollama list
```

You should see your Aarohi model `qwen3:1.7b`. Leave it — it is not used here and does not load unless called.
If `ollama` is not recognised, install Ollama from ollama.com/download/windows, then close and reopen PowerShell.

## Step 2 — Node 20 or 22 LTS (IMPORTANT)

You currently have **Node v24** (from BLACKCAT). Mindcraft warns Node 24+ can break its native dependencies.
Do NOT uninstall Node 24 — install **nvm-windows** instead so you can switch per project:

1. Download `nvm-setup.exe` from github.com/coreybutler/nvm-windows/releases
2. Install it, open a NEW PowerShell, then:

```powershell
nvm install 22
nvm use 22
node --version
```

It must show `v22.x`. Use `nvm use 24` later when you go back to other projects.

## Step 3 — Get Mindcraft

```powershell
cd C:\Users\patel\Downloads
git clone https://github.com/mindcraft-bots/mindcraft.git
cd mindcraft
npm install
```

## Step 4 — Copy this pack in + pull ONLY the lite models

Copy `andy.json`, `settings.js`, `keys.json`, and both numbered `.bat` files into `C:\Users\patel\Downloads\mindcraft\` (replace when asked).

Then double-click `01_PULL_MODELS.bat` — or run in PowerShell inside the mindcraft folder:

```powershell
ollama pull sweaterdog/andy-4:micro-q8_0
ollama pull embeddinggemma
```

This is the official Mindcraft Ollama command. One-time download (~2.2 GB total), needs internet only for this.
**Do NOT pull `sweaterdog/andy-4` without `:micro-q8_0` — that is the 8B model your laptop cannot run.**

Check: `ollama list` must show both models.

## Step 5 — Tune Minecraft BEFORE joining (required on 8 GB)

- Version: **Java Edition 1.21.6** exactly (create a 1.21.6 install in your launcher if needed — Mindcraft profile in this pack is locked to 1.21.6)
- Launcher JVM / max memory: **2 GB** (not 4 GB)
- In game: Graphics = Fast, Render Distance = 6, Simulation Distance = 5, Particles = Minimal, Clouds = Off

## Step 6 — Play

1. Launch Minecraft 1.21.6, open your singleplayer world (Survival, cheats ON is helpful for testing).
2. `Esc → Open to LAN → Start LAN World`. Note the port it shows (e.g. "hosted on port 55916") — you don't need to type it, this pack's settings use `port: -1` to auto-scan for your LAN world.
3. Double-click `02_START_BOT.bat` in the mindcraft folder (or `node main.js` in PowerShell there).
4. Wait — first reply is slowest while the model loads. Chinnu joins your world and a Mindcraft UI opens at localhost:8080.
5. Talk in game chat. Try in this order:
   - `Chinnu, hello`
   - `follow me`
   - `collect 5 oak logs` (stand near trees first)
   - `craft a crafting table`
   - `stop` — if it gets stuck

## Stop everything cleanly

Close the bot terminal (Ctrl+C), then exit the world. Ollama unloads the model from RAM after a few idle minutes.

## Troubleshooting

- **Bot never joins:** Minecraft must be 1.21.6, world must be Open to LAN *before* starting the bot, and Node must be v22 (Step 2).
- **Out of memory / game freezes:** something else is eating RAM — close Chrome/Aarohi, re-check Step 5 (2 GB, render 6). Do not raise Minecraft RAM.
- **Bot replies are dumb / forgets fast:** expected on micro — this pack deliberately cuts context (`max_messages: 8`, `num_examples: 1`) to fit your RAM. Give one simple job at a time.
- **Very slow first reply:** model loading on CPU. Wait 30–60 s once; later replies are faster.
- **Keep `allow_insecure_coding: false`** (already set in this pack). Never turn it on for a public server — the model can write/run code on your laptop.

## Honest limits of the offline choice

- 100% offline after Step 4, no key, no cost, private — that part is real.
- On this laptop it will feel like a slow, simple helper — not ChatGPT-level smart.
- If it feels too slow/dumb and you want the *same bot body* but smarter, switching only the model line in `andy.json` to free Groq/Gemini later takes 2 minutes and removes Ollama's RAM load entirely. That's your decision whenever — this pack does not do it.
