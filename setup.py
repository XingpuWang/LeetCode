from distutils.core import setup
from Cython.Build import cythonize

# setup(ext_modules=cythonize("/Users/xingpuwang/PycharmProjects/LeetCode/dfs/FDM.pyx"))
# setup(ext_modules=cythonize("/Users/xingpuwang/PycharmProjects/LeetCode/bruto/bruto.pyx"))
setup(ext_modules=cythonize("/Users/xingpuwang/PycharmProjects/LeetCode/dfs_no_prune/FDM_no_prune.pyx"))