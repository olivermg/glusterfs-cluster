#!/usr/bin/env bash

wget -O - https://download.gluster.org/pub/gluster/glusterfs/4.1/4.1.7/glusterfs-4.1.7.tar.gz | tar xzf -
cd glusterfs-4.1.7

./autogen.sh
./configure --prefix=/opt/glusterfs
make -j4 install

