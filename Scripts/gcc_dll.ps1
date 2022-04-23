$target = "$PSScriptRoot/../build"
$src = "$PSScriptRoot/../Qt/6.3.0/mingw_64/bin"

Copy-Item "$src/lib*.dll" $target
Copy-Item "$target/app.exe" "$target/main.exe" -Force
