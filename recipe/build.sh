#!/bin/bash


# FIXME: This is a hack to make sure the environment is activated.
# The reason this is required is due to the conda-build issue
# mentioned below.
#
# https://github.com/conda/conda-build/issues/910
#
source activate "${CONDA_DEFAULT_ENV}"

if [[ `uname` == 'Darwin' ]];
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
else
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi


./bootstrap \
             --prefix="${PREFIX}" \
             --system-curl \
             --system-bzip2 \
             --system-expat \
             --system-jsoncpp \
             --system-libarchive \
             --system-liblzma \
             --system-zlib \
             --no-qt-gui \
             -- \
             -DCMAKE_BUILD_TYPE:STRING=Release \

make
eval ${LIBRARY_SEARCH_VAR}="${PREFIX}/lib" make install
