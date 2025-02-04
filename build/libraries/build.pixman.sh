#!/bin/bash
set -e

cd pixman
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-arm-neon --disable-arm-a64-neon --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install
