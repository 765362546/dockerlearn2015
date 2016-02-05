#!/bin/bash
#

CURDIR=$(pwd)
TARDIR=${CURDIR}/sysroot
usage () {
echo "USAGE:$(basename $0) tarname";
}
[ $# -ne 1 ] && usage && exit 1
name=$1
cd $TARDIR
tar --numeric-owner -vcf $CURDIR/${name}.tar *
