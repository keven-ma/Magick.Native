#!/bin/bash -e

v_sdk=8512546_latest
v_ndk=r25c
v_ndk_n=25.2.9519653
v_sdk_build_tools=30.0.3

DIR=/root/magick-builder

os=linux
export os
[ -z "$cores" ] && cores=$(grep -c ^processor /proc/cpuinfo)
cores=${cores:-4}

if [ -n "$ndk_triple" ]; then
    export PKG_CONFIG_SYSROOT_DIR="$prefix_dir"
    export PKG_CONFIG_LIBDIR="$PKG_CONFIG_SYSROOT_DIR/lib/pkgconfig"
    unset PKG_CONFIG_PATH
fi

toolchain=$(echo "$DIR/sdk/android-ndk-${v_ndk}/toolchains/llvm/prebuilt/"*)
[ -d "$toolchain" ] && \
    export PATH="$toolchain/bin:$DIR/sdk/android-ndk-${v_ndk}:$DIR/sdk/bin:$PATH"
export ANDROID_HOME="$DIR/sdk/android-sdk-$os"
export ANDROID_NDK_ROOT="$DIR/sdk/android-ndk-${v_ndk}"
unset ANDROID_SDK_ROOT

mkdir -p "$DIR/sdk" && cd "$DIR/sdk"

# Android SDK
if [ ! -d "android-sdk-${os}" ]; then
    wget "https://dl.google.com/android/repository/commandlinetools-${os}-${v_sdk}.zip"
    mkdir "android-sdk-${os}"
    unzip -q -d "android-sdk-${os}" "commandlinetools-${os}-${v_sdk}.zip"
    rm "commandlinetools-${os}-${v_sdk}.zip"
fi
sdkmanager () {
    local exe="./android-sdk-$os/cmdline-tools/latest/bin/sdkmanager"
    [ -x "$exe" ] || exe="./android-sdk-$os/cmdline-tools/bin/sdkmanager"
    "$exe" --sdk_root="${ANDROID_HOME}" "$@"
}
echo y | sdkmanager \
    "platforms;android-33" "build-tools;${v_sdk_build_tools}" \
    "extras;android;m2repository"

# Android NDK (either standalone or installed by SDK)
if [ -d "android-ndk-${v_ndk}" ]; then
    :
elif [ -d "android-sdk-$os/ndk/${v_ndk_n}" ]; then
    ln -s "android-sdk-$os/ndk/${v_ndk_n}" "android-ndk-${v_ndk}"
elif [ -z "${os_ndk}" ]; then
    echo y | sdkmanager "ndk;${v_ndk_n}"
    ln -s "android-sdk-$os/ndk/${v_ndk_n}" "android-ndk-${v_ndk}"
else
    wget "http://dl.google.com/android/repository/android-ndk-${v_ndk}-${os_ndk}.zip"
    unzip -q "android-ndk-${v_ndk}-${os_ndk}.zip"
    rm "android-ndk-${v_ndk}-${os_ndk}.zip"
fi
if ! grep -qF "${v_ndk_n}" "android-ndk-${v_ndk}/source.properties"; then
    echo "Error: NDK exists but is not the correct version (expecting ${v_ndk_n})"
    exit 255
fi

cd ..
