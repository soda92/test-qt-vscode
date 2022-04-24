cmake_minimum_required(VERSION 3.21)
project(test-qt-vscode)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 COMPONENTS Widgets REQUIRED)
find_package(fmt CONFIG REQUIRED)

# https://cmake.org/pipermail/cmake/2009-June/030311.html
set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
    "Choose the type of build, options are: Debug Release
RelWithDebInfo MinSizeRel."
    FORCE)

set(CONSOLE "true" CACHE STRING "whether use console in windows." FORCE)

set(SRCS "src/main.cpp")

if(CONSOLE)
add_executable(app ${SRCS})
else()
add_executable(app WIN32 ${SRCS})
endif(CONSOLE)

# target_link_libraries(app PRIVATE Qt6::Widgets)
target_link_libraries(app PRIVATE Qt6::Core)
target_link_libraries(app PRIVATE fmt::fmt)

# https://stackoverflow.com/a/40572207/12291425

add_custom_target(
    qt-dll ALL
    DEPENDS app
    COMMAND ${Qt6_DIR}/../../../bin/windeployqt.exe --translations en --no-libraries $<TARGET_FILE:app>
)

add_custom_target(
    additional-dll ALL
    DEPENDS app
    COMMAND pwsh ../Scripts/dll.ps1
)
