#!/bin/bash
set -e

cd fribidi

if [ -e "lib/fribidi-config.h" ]; then
    rm lib/fribidi-config.h
fi

autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
