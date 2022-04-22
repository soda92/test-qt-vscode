cmake_minimum_required(VERSION 3.21)
project(test-qt-vscode)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Widgets REQUIRED)

if(DEBUG)
add_executable(app main.cpp)
else()
add_executable(app WIN32 main.cpp)
endif(DEBUG)

target_link_libraries(app PRIVATE Qt6::Widgets)

# https://stackoverflow.com/a/40572207/12291425

add_custom_target(
    qt-dll ALL
    DEPENDS app
    COMMAND ${Qt6_DIR}/../../../bin/windeployqt.exe $<TARGET_FILE:app>
)

add_custom_target(
    additional-dll ALL
    DEPENDS app
    COMMAND pwsh ../Scripts/gcc_dll.ps1
)
