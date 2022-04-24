if(Test-Path $PSScriptRoot/../vcpkg){

}else{
    Push-Location $PSScriptRoot/../

    git clone https://github.com/microsoft/vcpkg.git
    .\vcpkg\bootstrap-vcpkg.bat
    ./vcpkg/vcpkg.exe install fmt --triplet x64-mingw-dynamic

    Pop-Location
}

