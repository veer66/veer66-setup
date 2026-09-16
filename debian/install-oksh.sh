#!/bin/sh

set -e

echo Install prerequisites
su -c 'apt install build-essential libncurses-dev'

OKSH_VERSION=7.9
OKSH_NAME_VERSION=oksh-$OKSH_VERSION
OKSH_PKG=$OKSH_NAME_VERSION.tar.gz
OKSH_URL=https://github.com/ibara/oksh/releases/download/$OKSH_NAME_VERSION/$OKSH_PKG

echo Download
wget $OKSH_URL -O - | tar -xzvf -

cd $OKSH_NAME_VERSION

echo Configure
./configure

echo Build
make -j $(nproc)

echo Install
su -c 'make install'

cd ..
