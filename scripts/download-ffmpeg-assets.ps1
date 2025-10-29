# download-ffmpeg-assets.ps1
# Downloads FFmpeg.wasm assets to .\ffmpeg (beside this script).
param(
  [string]$Version = "0.12.6"
)
$ErrorActionPreference = "Stop"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$ffdir = Join-Path $here "..\ffmpeg"
New-Item -ItemType Directory -Force -Path $ffdir | Out-Null

$files = @(
  @{ url = "https://cdn.jsdelivr.net/npm/@ffmpeg/ffmpeg@$Version/dist/ffmpeg.min.js"; out = "ffmpeg.min.js" },
  @{ url = "https://cdn.jsdelivr.net/npm/@ffmpeg/core@$Version/dist/ffmpeg-core.js"; out = "ffmpeg-core.js" },
  @{ url = "https://cdn.jsdelivr.net/npm/@ffmpeg/core@$Version/dist/ffmpeg-core.wasm"; out = "ffmpeg-core.wasm" }
)

function Fetch($u,$o){
  $dest = Join-Path $ffdir $o
  Write-Host "Downloading $o from jsDelivr..."
  try { Invoke-WebRequest -Uri $u -OutFile $dest -UseBasicParsing -TimeoutSec 120; return }
  catch {
    Write-Warning "jsDelivr failed, trying unpkg..."
    $u2 = $u.Replace("cdn.jsdelivr.net/npm","unpkg.com")
    Invoke-WebRequest -Uri $u2 -OutFile $dest -UseBasicParsing -TimeoutSec 120
  }
}

foreach($f in $files){ Fetch $f.url $f.out }
Write-Host "Done. Files saved to $ffdir"
