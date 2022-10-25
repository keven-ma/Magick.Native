#!/bin/bash
set -e

cd harfbuzz
mkdir __build
cd __build
CXXFLAGS=$FLAGS meson .. $MESON_OPTIONS --buildtype=$MESON_BUILD_TYPE --prefix=/usr/local --default-library=static -Ddocs=disabled -Dtests=disabled -Dcairo=disabled
ninja install
