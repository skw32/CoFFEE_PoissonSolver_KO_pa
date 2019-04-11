from distutils.core import setup
from distutils.extension import Extension
#from Cython.Distutils import build_ext

#Check the dependencies
try:
  import scipy
except ImportError:
  print("scipy not found. Please install scipy: https://www.scipy.org/install.html")

try:
  import numpy
except ImportError:
  print("Numpy not found. Please install Numpy: https://docs.scipy.org/doc/numpy/user/install.html")

try:
  import mpi4py
except ImportError:
  print("mpi4py not found. Please install mpi4py: https://mpi4py.scipy.org/docs/usrman/install.html")

try:
  import matplotlib
except ImportError:
  print("matplotlib not found. Please install matplotlib: http://matplotlib.org/users/installing.html")


# always run the cythonize build step
use_cython = True
try:
    from Cython.Distutils import build_ext
    from Cython.Compiler import Options

    compiler_directives = Options.get_directive_defaults()

    # don't include host-specific metadata in generated .c files -- this allows storing the generated .c files in git
    # If you are debugging the .c files, you might change this temporarily 
    compiler_directives["emit_code_comments"] = False  # works

except ImportError:
  print("Cython not found. Please install Cython: https://cython.readthedocs.io/en/latest/src/quickstart/install.html")
  raise




cmdclass = {}
if use_cython:
  ext_modules=[ Extension("PoissonSolver.matvec2D",
              ["PoissonSolver/MV_2D_cy/matvec2D.pyx"],
              extra_compile_args = ["-ffast-math"]),
              Extension("PoissonSolver.matvec1D",
              ["PoissonSolver/MV_1D_cy/matvec1D.pyx"],
              extra_compile_args = ["-ffast-math"]),
              Extension("PoissonSolver.ps3d",
              ["PoissonSolver/PS_3D_cy/ps3d.pyx"],
              extra_compile_args = ["-ffast-math"])
            ]
  cmdclass.update({ 'build_ext': build_ext })
else:
  ext_modules=[ Extension("PoissonSolver.matvec2D",
              ["PoissonSolver/MV_2D_cy/matvec2D.c"],
              extra_compile_args = ["-ffast-math"]),
              Extension("PoissonSolver.matvec1D",
              ["PoissonSolver/MV_1D_cy/matvec1D.c"],
              extra_compile_args = ["-ffast-math"]),
              Extension("PoissonSolver.ps3d",
              ["PoissonSolver/PS_3D_cy/ps3d.c"],
              extra_compile_args = ["-ffast-math"])
            ]

setup(
  name = "PoissonSolver",
  packages=['PoissonSolver'],
  author="Mit H Naik",
  author_email = "mitnaik@physics.iisc.ernet.in",
  cmdclass = cmdclass,
  ext_modules = ext_modules,
  include_dirs = [numpy.get_include()] 
)
