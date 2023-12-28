SCRIPT_PATH="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )"

# Compiler settings
if [[ "${DEBUG_BUILD}" ]]; then
    export FLAGS="-g3 -O0 -fPIC -DDEBUG"
    export CMAKE_BUILD_TYPE="Debug"
    export MESON_BUILD_TYPE="debug"
else
    export FLAGS="-O3 -fPIC -DNDEBUG"
    export CMAKE_BUILD_TYPE="Release"
    export MESON_BUILD_TYPE="release"
fi

# Shared options
export PLATFORM=ANDROID
export QUANTUMS=("Q8" "Q16" "Q16-HDRI")
export EXTENSION="so"
export STRICT_FLAGS="${FLAGS} -Wall"
export CONFIGURE="./configure"
export CONFIGURE_OPTIONS="--host aarch64-linux-android"
export CMAKE_COMMAND="cmake"
export CMAKE_OPTIONS="-DCMAKE_TOOLCHAIN_FILE=$SCRIPT_PATH/cross-compilation.cmake"
export MAKE="make"
export MAKEFLAGS="-j$(nproc)"
export MESON_OPTIONS="--cross-file=$SCRIPT_PATH/cross-compilation.meson"
export CPPFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"
export PKG_PATH="/usr/local/lib/pkgconfig"
export SIMD_OPTIONS="-DWITH_SIMD=0"
export SSE_OPTIONS=""

# Library specific options
export FFI_OPTIONS=""
export FONTCONFIG_OPTIONS=""
export HEIF_OPTIONS=""
export LCMS_OPTIONS=""
export OPENEXR_OPTIONS=""
export WEBP_OPTIONS="--enable-libwebpmux --enable-libwebpdemux"
export XML_OPTIONS=""
export IMAGEMAGICK_OPTIONS=""

# Android ARM64 options
unset CC CXX CPATH LIBRARY_PATH C_INCLUDE_PATH CPLUS_INCLUDE_PATH
unset CFLAGS CXXFLAGS
export ndk_suffix=-arm64
export ndk_triple=aarch64-linux-android
export CC=aarch64-linux-android28-clang
export CXX=aarch64-linux-android28-clang++
export LDFLAGS="-L/usr/local/lib -Wl,-O2,--icf=safe"
export AR=llvm-ar
export RANLIB=llvm-ranlib

v_ndk=r25c
DIR=/root/magick-builder

toolchain=$(echo "$DIR/sdk/android-ndk-${v_ndk}/toolchains/llvm/prebuilt/"*)
[ -d "$toolchain" ] && \
    export PATH="$toolchain/bin:$DIR/sdk/android-ndk-${v_ndk}:$DIR/sdk/bin:$PATH"
export ANDROID_HOME="$DIR/sdk/android-sdk-linux"
export ANDROID_NDK_ROOT="$DIR/sdk/android-ndk-${v_ndk}"
unset ANDROID_SDK_ROOT

export CMAKE_OPTIONS="-DANDROID_PLATFORM=android-28 -DANDROID_ABI=arm64-v8a -DCMAKE_TOOLCHAIN_FILE=${ANDROID_NDK_ROOT}/build/cmake/android.toolchain.cmake"
