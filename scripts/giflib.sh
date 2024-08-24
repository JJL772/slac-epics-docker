#!/usr/bin/env bash
set -e

cd $EPICS_PACKAGE_TOP

_VERSION=4.1.6

mkdir -p giflib
cd giflib
mkdir $_VERSION
cd $_VERSION

wget "https://sourceforge.net/projects/giflib/files/giflib-4.x/giflib-$_VERSION/giflib-$_VERSION.tar.gz"

tar -xf "giflib-$_VERSION.tar.gz"

mkdir -p build/$EPICS_HOST_ARCH
cd build/$EPICS_HOST_ARCH

"../../giflib-$_VERSION/configure" --prefix="$PWD/../../$EPICS_HOST_ARCH"
make install
