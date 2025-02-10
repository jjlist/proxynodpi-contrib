#!/bin/sh -eux

# if [[ $1 != "run" ]]; then
# 	file="$1"
# else
# 	file="proxyserver.py"
# fi

file="proxyserver.py"

cp main.py c_main.py
cp proxyserver.py c_proxyserver.py

sed -i 's/proxyserver/c_proxyserver/' c_main.py

cat <<EOF >c_setup.py
from setuptools import setup
from Cython.Build import cythonize
setup(ext_modules = cythonize('c_${file}',annotate=False))
EOF

python3 c_setup.py build_ext --inplace

if [[ $1 = "run" ]]; then
	python3 c_main.py
fi
