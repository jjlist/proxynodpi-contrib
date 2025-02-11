from setuptools import setup
from Cython.Build import cythonize
setup(ext_modules = cythonize('c_proxyserver.py',annotate=False))
