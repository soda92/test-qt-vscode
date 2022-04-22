$target = "$PSScriptRoot/../build"
$src = "$PSScriptRoot/../Qt/6.3.0/mingw_64/bin"

Copy-Item "$src/libgcc_s_seh-1.dll","$src/libstdc++-6.dll" $target
