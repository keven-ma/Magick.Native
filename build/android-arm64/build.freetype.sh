#!/bin/bash
set -e

cd freetype

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build

cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_DISABLE_FIND_PACKAGE_BZip2=TRUE \
      -DZLIB_INCLUDE_DIR=/usr/local/include \
      -DZLIB_LIBRARY=/usr/local/lib/libz.a \
      -DCMAKE_DISABLE_FIND_PACKAGE_PNG=TRUE \
      -DBUILD_SHARED_LIBS=off \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS"

$MAKE install
