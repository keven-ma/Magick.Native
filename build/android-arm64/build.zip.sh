#!/bin/bash
set -e

cd zip

if [ -e "lib/config.h" ]; then
    rm lib/config.h
fi
if [ -e "lib/zip_err_str.c" ]; then
    rm lib/zip_err_str.c
fi
if [ -e "lib/zipconf.h" ]; then
    rm lib/zipconf.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build

cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_SHARED_LIBS=off \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS"

$MAKE install
