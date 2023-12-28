#!/bin/bash
set -e

cd harfbuzz
if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

CXXFLAGS=$FLAGS
meson .. $MESON_OPTIONS \
      --buildtype=$MESON_BUILD_TYPE \
      --prefix=/usr/local \
      --default-library=static \
      -Ddocs=disabled \
      -Dtests=disabled \
      -Dcairo=disabled \
      -Dicu=disabled

# -Dicu=disabled 是我的加的，要不然编译会报错
ninja install
