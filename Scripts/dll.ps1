$target = "$PSScriptRoot/../build"
$dist = "$PSScriptRoot/../dist"

Copy-Item "$target/app.exe" "$dist/main.exe" -Force

Push-Location $PSScriptRoot/../
& ".\petool\petool.exe"
Pop-Location
