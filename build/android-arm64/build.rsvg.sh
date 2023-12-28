#!/bin/bash
set -e

cd rsvg

export GLIB_MKENUMS="/usr/local/bin/glib-mkenums"
export GLIB_GENMARSHAL="/usr/local/bin/glib-genmarshal"
cd gdk-pixbuf

if [ -e "gdk-pixbuf/config.h" ]; then
    rm gdk-pixbuf/config.h
fi
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --with-included-loaders=yes --enable-modules=no --prefix=/usr/local CFLAGS="$FLAGS"
$MAKE install

cd ../librsvg

if [ -e "config.h" ]; then
    rm config.h
fi
autoreconf -fiv
chmod +x ./configure
$CONFIGURE $CONFIGURE_OPTIONS --disable-shared --disable-Bsymbolic --disable-introspection --disable-pixbuf-loader --prefix=/usr/local CFLAGS="$FLAGS -I/usr/local/include/libcroco-0.6/libcroco"
$MAKE install
