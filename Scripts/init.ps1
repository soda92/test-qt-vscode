pip install -U pip
pip install aqtinstall

Push-Location $PSScriptRoot/../
if (Test-Path "Qt") {
}
else {
    New-Item -ItemType Directory -Name Qt
}
Pop-Location
Push-Location $PSScriptRoot/../Qt
aqt install-qt windows desktop 6.3.0 win64_mingw
Pop-Location
