#!/bin/bash 

set -ex

apt update

apt install -y pkg-config build-essential ninja-build git \
  libglib2.0-dev \
  libpixman-1-dev \
  bison \
  flex \
  libfdt-dev \
  libsdl2-dev \
  re2c \
  libncurses5-dev \
  libncursesw5-dev \
  zlib1g-dev \
  libasound2-dev \
  libpulse-dev \
  libseccomp-dev \
  libssh-dev \
  libboost-all-dev \
  libtool \
  libssl-dev \
  libaio-dev \
  libbluetooth-dev \
  libcapstone-dev \
  libbrlapi-dev \
  libbz2-dev \
  libcap-ng-dev \
  libcurl4-gnutls-dev \
  libgtk-3-dev \
  libibverbs-dev \
  libnuma-dev \
  librbd-dev \
  librdmacm-dev \
  libsasl2-dev \
  libsnappy-dev \
  libvde-dev \
  libvdeplug-dev \
  libvte-dev \
  libxen-dev \
  liblzo2-dev \
  valgrind \
  xfslibs-dev \
  libnfs-dev \
  libiscsi-dev \
  libunistring-dev \
  libp11-kit-dev \
  libspice-protocol-dev \
  libspice-server-dev 

rm -rf build
mkdir -p build
cd build

../configure \
  --static \
  --disable-werror \
  --prefix=$PWD/.qemu \
  --target-list=aarch64_be-linux-user

make -j $(nproc)

make install
