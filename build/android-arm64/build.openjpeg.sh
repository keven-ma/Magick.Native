#!/bin/bash
set -e

cd openjpeg

if [ -e "src/lib/openjp2/opj_config.h" ]; then
    rm src/lib/openjp2/opj_config.h
fi
if [ -e "src/lib/openjp2/opj_config_private.h" ]; then
    rm src/lib/openjp2/opj_config_private.h
fi

$CMAKE_COMMAND . $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_C_FLAGS="$FLAGS" || true
$CMAKE_COMMAND . $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
cp bin/libopenjp2.a /usr/local/lib
