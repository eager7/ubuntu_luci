#!/bin/sh
ROOT_DIR=`pwd`
PACKAGES="libxml2 zlib1g-dev libtecla-dev libjson-c-dev libavahi-client-dev libdaemon-dev libsqlite3-dev libncurses5-dev libncursesw5-dev "

tar -jxvf luci.tar.bz2
tar -jxvf uhttpd.tar.bz2

unzip cyassl-1.4.0.zip
mv cyassl-1.4.0 uhttpd/src/
tar -xvf lua-5.1.4.tar.gz
mv lua-5.1.4 uhttpd/src/

cd $ROOT_DIR
cd uhttpd/src/cyassl-1.4.0;./configure && make
cd $ROOT_DIR
cd uhttpd/src/lua-5.1.4; ./configure && make
cd $ROOT_DIR
cd uhttpd/src/; make

cd $ROOT_DIR
mv uhttpd/src/ luci/contrib/uhttpd/uhttpd-src/

cd $ROOT_DIR
cp luci-bwc.c luci/modules/admin-full/src/

cd $ROOT_DIR
cd luci; make runuhttpd
