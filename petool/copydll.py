from pathlib import Path

CURRENT = Path(__file__).resolve().parent
tool = CURRENT.joinpath("petool.exe")
import subprocess
import typing
import os
import shutil
import logging

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%m/%d/%Y %I:%M:%S %p",
)


def is_sys_dll(name: str) -> bool:
    for file in os.listdir("C:/Windows/system32"):
        if file.lower() == name.lower():
            return True
    return False


def get_dlls(path: str) -> typing.List[str]:
    process = subprocess.run(args=[str(tool), str(path)], stdout=subprocess.PIPE)
    return list(
        map(
            get_real_path,
            filter(
                lambda x: not is_sys_dll(x), process.stdout.decode().strip().split()
            ),
        ),
    )


def get_dll_tree(s: set, path: str) -> None:
    dlls = get_dlls(path)
    if len(dlls) != 0:
        s.update(dlls)
        for dll in dlls:
            get_dll_tree(s, dll)


def get_real_path(name: str) -> str:
    dll_paths = [
        "Qt/6.3.0/mingw_64/bin",
        "vcpkg/installed/x64-mingw-dynamic/bin",
        "vcpkg/installed/x64-mingw-dynamic/debug/bin",
    ]
    for p in dll_paths:
        path = CURRENT.parent.joinpath(p)
        for i in os.listdir(path):
            if i == name:
                return str(path.joinpath(i))
    logging.error(f"{name} not found")
    return ""


s = set()
get_dll_tree(s, CURRENT.parent.joinpath("dist/main.exe"))
# print(s)

# print(
#     get_dlls(
#         "D:\\src\\test-qt-vscode\\vcpkg\\installed\\x64-mingw-dynamic\\debug\\bin\\libfmtd.dll"
#     )
# )

DEST = CURRENT.parent.joinpath("dist")
for i in s:
    shutil.copy(i, DEST)
