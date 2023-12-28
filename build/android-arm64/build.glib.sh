#!/bin/bash
set -e

cd glib

if [ -e "gio/gioenumtypes.c" ]; then
    rm gio/gioenumtypes.c
fi
if [ -e "gio/gioenumtypes.h" ]; then
    rm gio/gioenumtypes.h
fi
if [ -e "gio/gnetworking.h" ]; then
    rm gio/gnetworking.h
fi
if [ -e "glib/config.h" ]; then
    rm glib/config.h
fi
if [ -e "glib/glibconfig.h" ]; then
    rm glib/glibconfig.h
fi
if [ -e "glib/gnulib/gnulib_math.h" ]; then
    rm glib/gnulib/gnulib_math.h
fi
if [ -e "gmodule/gmoduleconf.h" ]; then
    rm gmodule/gmoduleconf.h
fi
if [ -e "gobject/glib-enumtypes.h" ]; then
    rm gobject/glib-enumtypes.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

export CFLAGS="$FLAGS"
meson $MESON_OPTIONS \
      --prefix=/usr/local \
      --buildtype=$MESON_BUILD_TYPE \
      --default-library=static \
      -Dselinux=disabled \
      -Dxattr=false \
      -Dlibmount=disabled \
      -Dnls=disabled \
      -Dinternal_pcre=true \
      -Dgtk_doc=false \
      -Dman=false \
      ..

ninja install

if [ -d /usr/local/lib/x86_64-linux-gnu ]; then
  cp /usr/local/lib/x86_64-linux-gnu/*.a /usr/local/lib/
fi
if [ -d /usr/local/lib/x86_64-linux-gnu/pkgconfig ]; then
  mv /usr/local/lib/x86_64-linux-gnu/pkgconfig/*.pc $PKG_PATH
fi
chmod 755 /usr/local/bin/glib-genmarshal
chmod 755 /usr/local/bin/glib-mkenums
