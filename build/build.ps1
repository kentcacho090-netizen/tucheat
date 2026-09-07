$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$out = Join-Path $root 'dist'
New-Item -ItemType Directory -Force $out | Out-Null
Copy-Item (Join-Path $root 'src/TUCheat.UI.ps1') (Join-Path $out 'TUCheat.ps1') -Force
Write-Host 'Build complete: dist\TUCheat.ps1'
