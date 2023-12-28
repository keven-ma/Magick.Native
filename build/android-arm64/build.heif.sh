#!/bin/bash
set -e

cd heif

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build
$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DCMAKE_FIND_ROOT_PATH=/usr/local \
      -DBUILD_SHARED_LIBS=false \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DWITH_EXAMPLES=false \
      -DENABLE_PLUGIN_LOADING=false \
      -DWITH_JPEG_DECODER=false \
      -DWITH_JPEG_ENCODER=false \
      -DCMAKE_C_FLAGS="$FLAGS" \
      -DCMAKE_CXX_FLAGS="$FLAGS" \
      -DBUILD_TESTING=off

# -DBUILD_TESTING=off是我加的，不然会报__android_log_write的链接错误

$MAKE install
