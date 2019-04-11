import os
import glob
from shutil import rmtree

globs = ["build", "**/__pycache__", "PoissonSolver/**/*.so", "PoissonSolver/**/*.c", "**/*.pyc" ]

for pattern in globs:
    for p in glob.glob(pattern, recursive=True):
        if os.path.isfile(p):
            print(f"Removing file '{p}''")
            os.remove(p)
        elif os.path.isdir(p):
            print(f"Removing directory '{p}''")
            rmtree(p)

