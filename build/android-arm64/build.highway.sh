#!/bin/bash
set -e

cd highway

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_SHARED_LIBS=off \
      -DBUILD_TESTING=off \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS" \
      -DCMAKE_CXX_FLAGS="$FLAGS"

$MAKE install
