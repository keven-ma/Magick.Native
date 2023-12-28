#!/bin/bash
set -e

cd tiff

if [ -e "libtiff/tif_config.h" ]; then
    rm libtiff/tif_config.h
fi
if [ -e "libtiff/tiffconf.h" ]; then
    rm libtiff/tiffconf.h
fi

autoreconf -fiv
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared CFLAGS="$FLAGS" CXXFLAGS="$FLAGS"
echo '' > version
$MAKE install
