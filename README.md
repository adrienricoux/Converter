# GIF Inline Exporter (with optional animated WebP) — Offline Package

This bundle lets you inline GIFs from your JSON export and optionally produce **animated WebP** copies — **offline**.

## Contents
- `index.html` — the tool (open in Chrome)
- `ffmpeg/` — put encoder assets here for offline WebP
- `scripts/download-ffmpeg-assets.ps1` — PowerShell helper (Windows)
- `scripts/download-ffmpeg-assets.sh` — Bash helper (macOS/Linux/WSL)

## Offline setup for WebP
If your network blocks CDNs, download the encoder files once and place them under `./ffmpeg`:

Required files (version 0.12.6):
- `ffmpeg/ffmpeg.min.js`
- `ffmpeg/ffmpeg-core.js`
- `ffmpeg/ffmpeg-core.wasm`

Use the helper scripts to fetch from jsDelivr or unpkg.
After files exist locally, tick “Also create animated WebP (lossless)” and run.

## Usage
1. Open `index.html` in Chrome.
2. Pick your JSON export and the `jefit_export` directory.
3. Choose **Mode** (Replace vs Append) and optionally enable WebP.
4. Click **Process & Inline**.
5. Use **Download Inlined JSON** or **Download JS Array**/**Copy Array**.

## Notes
- WebP option is **lossless** and preserves animation/looping.
- If you later want smaller files, you can drop original GIFs and keep only WebP arrays.
