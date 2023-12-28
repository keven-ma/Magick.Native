#!/bin/bash
set -e

cd exr/imath

if [ -e "ImathConfig.h" ]; then
    rm ImathConfig.h
fi

$CMAKE_COMMAND . $CMAKE_OPTIONS -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=off -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DBUILD_TESTING=off -DCMAKE_CXX_FLAGS="$FLAGS"
$MAKE install

cd ../openexr

if [ -e "IexConfig.h" ]; then
    rm IexConfig.h
fi
if [ -e "IexConfigInternal.h" ]; then
    rm IexConfigInternal.h
fi
if [ -e "IlmThreadConfig.h" ]; then
    rm IlmThreadConfig.h
fi
if [ -e "OpenEXRConfig.h" ]; then
    rm OpenEXRConfig.h
fi
if [ -e "OpenEXRConfigInternal.h" ]; then
    rm OpenEXRConfigInternal.h
fi

$CMAKE_COMMAND . $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_SHARED_LIBS=off \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DBUILD_TESTING=off \
      -DOPENEXR_BUILD_TOOLS=off \
      -DOPENEXR_INSTALL_EXAMPLES=off \
      $OPENEXR_OPTIONS \
      -DCMAKE_CXX_FLAGS="-L/usr/local/lib $FLAGS" \
      -DImath_DIR=/usr/local/lib/cmake/Imath/

$MAKE install
