#!/bin/bash
set -e

cd cairo

if [ -e "src/cairo-features.h" ]; then
    rm src/cairo-features.h
fi
if [ -e "src/config.h" ]; then
    rm src/config.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

CFLAGS=$FLAGS
meson .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Dxlib=disabled -Dquartz=disabled -Dfontconfig=enabled -Dfreetype=enabled -Dtests=disabled

sed -i 's/#define CAIRO_HAS_PTHREAD 1/#define CAIRO_NO_MUTEX 1/' config.h

ninja install
