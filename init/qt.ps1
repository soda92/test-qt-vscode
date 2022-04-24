pip install -U pip
# https://github.com/miurahr/aqtinstall
pip install aqtinstall

# get versions: aqt list-qt windows desktop
# get dists of version: aqt list-qt windows desktop --arch [version]

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
