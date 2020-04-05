#!/bin/sh
cd build
#GI_TYPELIB_PATH=. LD_LIBRARY_PATH=. gjs
export LD_LIBRARY_PATH=`pwd`/.libs:$LD_LIBRARY_PATH
export GI_TYPELIB_PATH=`pwd`
gjs