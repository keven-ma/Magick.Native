#!/bin/bash
set -e

cd lqr
autoreconf -fiv
chmod +x ./configure
if [ ! -d "/usr/local/include/lqr-1" ]; then
    mkdir /usr/local/include/lqr-1
fi
if [ ! -d "/usr/local/include/lqr-1/lqr" ]; then
    mkdir /usr/local/include/lqr-1/lqr
fi

$CONFIGURE $CONFIGURE_OPTIONS --prefix=/usr/local --disable-shared CFLAGS="$FLAGS"
$MAKE install
