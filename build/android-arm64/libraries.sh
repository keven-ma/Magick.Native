#!/bin/bash
set -e

$1/build.zlib.sh
$1/build.lzma.sh
$1/build.bzlib.sh
$1/../android-arm64/build.zip.sh
$1/build.xml.sh
$1/build.png.sh
$1/../android-arm64/build.freetype.sh
$1/../android-arm64/build.fontconfig.sh
$1/../android-arm64/build.jpeg-turbo.sh
$1/../android-arm64/build.tiff.sh
$1/build.webp.sh
$1/../android-arm64/build.openjpeg.sh
$1/build.lcms.sh
$1/../android-arm64/build.aom.sh
$1/build.de265.sh
$1/../android-arm64/build.heif.sh
$1/build.raw.sh
$1/build.deflate.sh
$1/../android-arm64/build.exr.sh
$1/../android-arm64/build.ffi.sh
$1/../android-arm64/build.glib.sh
$1/../android-arm64/build.lqr.sh
$1/build.pixman.sh
$1/../android-arm64/build.cairo.sh
$1/../android-arm64/build.fribidi.sh
$1/../android-arm64/build.harfbuzz.sh
$1/../android-arm64/build.pango.sh
$1/build.croco.sh
$1/../android-arm64/build.rsvg.sh
$1/../android-arm64/build.raqm.sh
$1/../android-arm64/build.highway.sh
$1/../android-arm64/build.brotli.sh
$1/../android-arm64/build.jpeg-xl.sh
