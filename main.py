import subprocess
import pathlib

CURRENT = pathlib.Path(__file__).resolve().parent
main = CURRENT.joinpath("dist").joinpath("main.exe")
subprocess.run(args=[str(main)])
