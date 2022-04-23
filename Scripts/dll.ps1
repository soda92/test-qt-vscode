$target = "$PSScriptRoot/../build"
$src = "$PSScriptRoot/../Qt/6.3.0/mingw_64/bin"

Copy-Item "$src/lib*.dll" $target
Copy-Item "$target/app.exe" "$target/main.exe" -Force

$vcpkg_src = "$PSScriptRoot/../vcpkg/installed/x64-mingw-dynamic/debug/bin"
Copy-Item "$vcpkg_src/libfmtd.dll" $target
