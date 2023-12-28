FROM ubuntu:22.04

# Uncomment the next line when using it in China !!!!!!
# RUN sed -i "s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g" /etc/apt/sources.list

WORKDIR /root

RUN apt-get update

RUN apt-get -y install apt-utils automake autoconf autopoint pkg-config build-essential libtool-bin \
    clang python3-pip python3-setuptools unzip git wget bison gettext vim gperf ragel texinfo gtk-doc-tools

RUN python3 -m pip install --no-cache-dir cmake==3.24.1.1
RUN python3 -m pip install --no-cache-dir meson==0.61.5
RUN python3 -m pip install --no-cache-dir ninja==1.10.2.3

# for build.fontconfig.sh
RUN python3 -m pip install --no-cache-dir lxml
RUN python3 -m pip install --no-cache-dir six

RUN apt-get -y install openjdk-11-jre
RUN apt-get -y install openjdk-11-jdk

RUN echo 'alias ll="ls -al"' >> ~/.bashrc

# Git setup
RUN git config --global push.default simple
RUN git config --global user.name "whoever"
RUN git config --global user.email "whoever@whatever.com"

COPY download-android-sdk.sh /root/

WORKDIR /root

ENTRYPOINT ["/bin/bash"]
