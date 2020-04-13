#!/bin/sh
#cd build
#GI_TYPELIB_PATH=. LD_LIBRARY_PATH=. gjs
export LD_LIBRARY_PATH=`pwd`/build
export GI_TYPELIB_PATH=`pwd`/build
gjs $1