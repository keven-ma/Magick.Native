#!/bin/bash
set -e

cd fontconfig
autoreconf -fiv
chmod +x ./configure

$CONFIGURE $CONFIGURE_OPTIONS --enable-libxml2 --enable-static=yes --disable-nls --disable-shared $FONTCONFIG_OPTIONS CFLAGS="$FLAGS"
$MAKE install
