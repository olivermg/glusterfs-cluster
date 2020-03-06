#!/usr/bin/env bash

wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/7.3/glusterfs-7.3.tar.gz | tar xzf -
cd glusterfs-7.3

./autogen.sh
./configure --prefix=/opt/glusterfs
make -j4 install
