# Build Docker Image

```bash
cd thisfolder__

docker build -t magick-builder .
```

# Run Docker Image

```bash 
docker run -it magick-builder

```

# Download android sdk

```bash
cd /root/

chmod a+x ./download-android-sdk.sh

./download-android-sdk.sh
```

# Clone Magick.Native and Libraries

```bash
mkdir -p /root/magick-builder/deps/

cd /root/magick-builder/deps/

git clone https://github.com/keven-ma/Magick.Native.git

cd /root/magick-builder/deps/Magick.Native/src/ImageMagick

./checkout.sh linux ../../../artifacts

chmod +x  /root/magick-builder/deps/Magick.Native/build/android-arm64/*.sh
```

# Patch the source code
```bash
vi /root/magick-builder/deps/Magick.Native/src/ImageMagick/libraries/cairo/util/malloc-stats.c
```

```c
#include <execinfo.h>
// Add the next line here to fix the compiling error for clang
char **backtrace_symbols(void _const_ buffer, int size);
```

# Build Libraries

```bash
cd /root/magick-builder/deps/Magick.Native/src/ImageMagick/libraries

../../../build/shared/build.Libraries.sh ../../../build/libraries android arm64

```

# Build ImageMagick

```bash
cd /root/magick-builder/deps/Magick.Native/src/ImageMagick/libraries

../../../build/shared/build.ImageMagick.sh android arm64

```

# Build Magick.Native

```bash
cd /root/magick-builder/deps/Magick.Native/src/Magick.Native

../../build/shared/build.Native.sh android arm64
```

# Copy Magick.Native so

```bash
cd /root/magick-builder/deps/Magick.Native/src/Magick.Native

../../build/shared/copy.Native.sh ../../artifacts android arm64
```

# Get the final output

**shared library folder:**

/root/magick-builder/deps/Magick.Native/artifacts

**static libs folder:**

/usr/local/lib/