#!/usr/bin/env bash

while test $# -gt 0; do
    case $1 in
    -v|--version)
        _VERSION=$2
        shift 2
        ;;
    esac
done

[ -z "$_VERSION" ] && echo "ERROR: missing -v" && exit 1

mkdir -p $EPICS_BASE
cd $EPICS_BASE/../

git clone https://github.com/epics-base/epics-base.git --recursive $_VERSION -b $_VERSION

cd $_VERSION
make -j$(nproc)
