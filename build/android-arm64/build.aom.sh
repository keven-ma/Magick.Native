#!/bin/bash
set -e

cd aom

if [ -e "config/aom_config.h" ]; then
    rm config/*.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DAOM_TARGET_CPU=generic -DCONFIG_RUNTIME_CPU_DETECT=0 -DCONFIG_MULTITHREAD=0 -DENABLE_DOCS=0 -DENABLE_EXAMPLES=0 -DENABLE_TESTS=0 -DENABLE_TOOLS=0 -DCONFIG_WEBM_IO=0 -DCMAKE_C_FLAGS="$FLAGS"
$MAKE install
