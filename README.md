# test-qt-vscode
 test developing qt in vscode.

## 开发环境设置

- 安装scoop，通过scoop安装`cmake, ninja, pwsh, python, git, gcc, gdb, go`.
- 打开pwsh, 切换到项目目录
- 通过`init/qt.ps1`安装qt, `init/vcpkg.ps1`安装fmt.
- 进入petool目录, 运行`go build`生成`petool.exe`.
- 返回到项目目录, 导入命令: `. .\func.ps1`.
- 执行`config`
- 执行`build`
- 运行程序: `py main.py`
