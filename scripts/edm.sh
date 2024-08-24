#!/usr/bin/env bash
set -e

_CO=0
while test $# -gt 0; do
    case $1 in
    -v|--version)
        _VERSION=$2
        shift 2
        ;;
    --clone-only)
        _CO=1
        shift
        ;;
    esac
done

[ -z "$_VERSION" ] && echo "ERROR: missing -v" && exit 1

cd $EPICS_EXTENSIONS
mkdir -p edm
cd edm

if [ ! -d $_VERSION ]; then
    git clone https://github.com/slac-epics/edm.git $_VERSION -b $_VERSION
fi

if [ $_CO -eq 1 ]; then
    exit 0
fi

cd $_VERSION

for a in /build/patches/*-edm-*.patch; do
    echo "Applying $a"
    patch -p1 -f -u --verbose < $a
done

# Generate a common config
echo 'CXX_STD = c++11'                  > configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'X11_LIB=/usr/lib64'               >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'X11_INC=/usr/include/X11'         >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'MOTIF_LIB=/usr/lib64'             >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'MOTIF_INC=/usr/include'           >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo "GIF_LIB=/usr/lib"                 >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo "GIF_INC=/usr/include"             >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'PNG_LIB=/usr/lib64'               >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}
echo 'PNG_INC=/usr/include'             >> configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}

cat configure/CONFIG_SITE.${EPICS_HOST_ARCH}.${EPICS_HOST_ARCH}

make
