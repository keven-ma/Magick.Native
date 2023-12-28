#!/bin/bash
set -e

cd xml

if [ -e "config.h" ]; then
    rm config.h
fi
if [ -e "include/libxml/xmlversion.h" ]; then
    rm include/libxml/xmlversion.h
fi

if [ -d "__build" ]; then
    rm -rf __build
fi
mkdir __build
cd __build

$CMAKE_COMMAND .. $CMAKE_OPTIONS \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DBUILD_SHARED_LIBS=off \
      -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE \
      -DCMAKE_C_FLAGS="$FLAGS" \
      -DLIBXML2_WITH_C14N=off \
      -DLIBXML2_WITH_CATALOG=off \
      -DLIBXML2_WITH_DEBUG=off \
      -DLIBXML2_WITH_HTML=off \
      -DLIBXML2_WITH_HTTP=off \
      -DLIBXML2_WITH_ICONV=off \
      -DLIBXML2_WITH_LZMA=off \
      -DLIBXML2_WITH_OUTPUT=off \
      -DLIBXML2_WITH_PATTERN=off \
      -DLIBXML2_WITH_PYTHON=off \
      -DLIBXML2_WITH_READER=off \
      -DLIBXML2_WITH_REGEXPS=off \
      -DLIBXML2_WITH_SCHEMAS=off \
      -DLIBXML2_WITH_SCHEMATRON=off \
      -DLIBXML2_WITH_TREE=off \
      -DLIBXML2_WITH_VALID=off \
      -DLIBXML2_WITH_WRITER=off \
      -DLIBXML2_WITH_XINCLUDE=off \
      -DLIBXML2_WITH_XPATH=off \
      -DLIBXML2_WITH_XPTR=off \
      -DZLIB_INCLUDE_DIR=/usr/local/include \
      -DZLIB_LIBRARY=/usr/local/lib/libz.a

$MAKE install
