#!/bin/sh
meson build --buildtype=debug && ninja -C build
cd build
cp Bodhi@sha/Bodhi-0.1.gir .
g-ir-compiler --shared-library=libBodhi.so --output=Bodhi-0.1.typelib Bodhi-0.1.gir
