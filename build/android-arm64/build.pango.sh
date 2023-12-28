#!/bin/bash
set -e

cd pango

if [ -e "pango/config.h" ]; then
    rm pango/config.h
fi
if [ -e "pango/pango-features.h" ]; then
    rm pango/pango-features.h
fi
if [ -e "pango/pango-enum-types.c" ]; then
    rm pango/pango-enum-types.c
fi
if [ -e "pango/pango-enum-types.h" ]; then
    rm pango/pango-enum-types.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

CFLAGS=$FLAGS
meson .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Dgtk_doc=false -Dintrospection=false
ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
