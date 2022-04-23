cmake_minimum_required(VERSION 3.21)
project(test-qt-vscode)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Widgets REQUIRED)

set(SRCS "main.cpp")

if(DEBUG)
add_executable(app ${SRCS})
else()
add_executable(app WIN32 ${SRCS})
endif(DEBUG)

# target_link_libraries(app PRIVATE Qt6::Widgets)
target_link_libraries(app PRIVATE Qt6::Core)

# https://stackoverflow.com/a/40572207/12291425

add_custom_target(
    qt-dll ALL
    DEPENDS app
    COMMAND ${Qt6_DIR}/../../../bin/windeployqt.exe --translations zh_CN,en $<TARGET_FILE:app>
)

add_custom_target(
    additional-dll ALL
    DEPENDS app
    COMMAND pwsh ../Scripts/gcc_dll.ps1
)
