# usage: . .\func.ps1
# https://stackoverflow.com/a/6016630/12291425

function config {
    .\Scripts\config.ps1
}

function clean {
    .\Scripts\clean.ps1
}

function build {
    .\Scripts\build.ps1
}

function run {
    .\dist\main.exe
}
