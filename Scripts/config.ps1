$Env:Qt6_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6WidgetsTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6CoreTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6GuiTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"

# https://stackoverflow.com/a/68145081/12291425
$Env:VCPKG_DEFAULT_TRIPLET="x64-mingw-dynamic"
$Env:VCPKG_DEFAULT_HOST_TRIPLET="x64-mingw-dynamic"

$Env:CC="gcc"
$Env:CXX="g++"
cmake -B $PSScriptRoot/../build -G "Ninja" `
 -Wno-dev -DDEBUG=1 -DCMAKE_BUILD_TYPE=Debug `
 -DCMAKE_TOOLCHAIN_FILE="$PSSCriptRoot/../vcpkg/scripts/buildsystems/vcpkg.cmake"
