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
