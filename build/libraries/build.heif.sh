#!/bin/bash
set -e

cd heif

mkdir __build
cd __build
$CMAKE_COMMAND .. $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_FIND_ROOT_PATH=/usr/local -DBUILD_SHARED_LIBS=false -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DWITH_EXAMPLES=false -DENABLE_PLUGIN_LOADING=false -DWITH_JPEG_DECODER=false -DWITH_JPEG_ENCODER=false -DCMAKE_C_FLAGS="$FLAGS" -DCMAKE_CXX_FLAGS="$FLAGS"
$MAKE install
