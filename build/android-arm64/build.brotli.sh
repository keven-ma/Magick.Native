#!/bin/bash
set -e

cd brotli

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_SHARED_LIBS=false \
      -DBROTLI_DISABLE_TESTS=true \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS -DBROTLI_EXTERNAL_DICTIONARY_DATA"

$MAKE install
