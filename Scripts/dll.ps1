$target = "$PSScriptRoot/../ninja-build"
$dist = "$PSScriptRoot/../dist"
if (Test-Path $dist) {}else {
    New-Item -ItemType Directory -Path $dist
}

Copy-Item "$target/app.exe" "$dist/main.exe" -Force

Push-Location $PSScriptRoot/../petool
python copydll.py
Pop-Location
