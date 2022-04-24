$target = "$PSScriptRoot/../ninja-build"
$dist = "$PSScriptRoot/../dist"

Copy-Item "$target/app.exe" "$dist/main.exe" -Force

Push-Location $PSScriptRoot/../petool
python copydll.py
Pop-Location
