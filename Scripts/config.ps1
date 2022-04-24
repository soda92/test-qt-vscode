$Env:Qt6_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6WidgetsTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6CoreTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:Qt6GuiTools_DIR = "$PSScriptRoot/../Qt/6.3.0/mingw_64"
$Env:CMAKE_PREFIX_PATH = "$PSSCriptRoot/../vcpkg/installed/x64-mingw-dynamic"

$Env:CC = "gcc"
$Env:CXX = "g++"
cmake -B $PSScriptRoot/../ninja-build -G "Ninja" -Wno-dev -DDEBUG=1 -DCMAKE_BUILD_TYPE=Debug
