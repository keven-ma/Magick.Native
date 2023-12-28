#!/bin/bash
set -e

cd jpeg-turbo

if [ -e "jconfig.h" ]; then
    rm jconfig.h
fi
if [ -e "jconfigint.h" ]; then
    rm jconfigint.h
fi
if [ -e "jversion.h" ]; then
    rm jversion.h
fi


$CMAKE_COMMAND . $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DENABLE_SHARED=off \
      $SIMD_OPTIONS \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS"

$MAKE install
