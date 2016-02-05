#!/bin/bash
#
CURDIR=$(pwd)
DEST=$CURDIR/sysroot

libcp(){
  LIBPATH=${1%/*}
  [ ! -d $DEST$LIBPATH ] && mkdir -p $DEST$LIBPATH &> /dev/null
  [ ! -e $DEST$1 ] && cp  $1 $DEST$LIBPATH/ && echo "lib $1 copy finished"
}

bincp(){
   CMDPATH=${1%/*}
   [ ! -d $DEST$CMDPATH ] && mkdir -p $DEST$CMDPATH &> /dev/null
   [ ! -e $DEST$1 ] && cp  $1 $DEST$CMDPATH/ && echo -e  "\033[31m $1 \033[0m copy finished!" || echo -e "\033[31m$1\033[0m is existed"
   #&& echo "$1 copy finished"

   for LIB in `ldd $1 |grep -o "/.*lib\(64\)\{0,1\}/[^[:space:]]\{1,\}"`;do
     libcp $LIB
   done

 }

read -p "Your command:" CMD
until [ $CMD == 'q' ];do
    ! which $CMD &> /dev/null  && echo "Wrong command" && read -p "Input again:" CMD && continue
   COMMAND=`which $CMD |grep -v "^alias"|grep -o "[^[:space:]]\{1,\}"`
   bincp $COMMAND
   read -p "Continue:" CMD
done












#ldd /usr/bin/vim |grep -o "/.*lib\(64\)\{0,1\}/[^[:space:]]\{1,\}"
