#!/bin/sh

# This file is made by modifying Emacs debian package scripts, i.e.,
# rules, control.
#
# This file is licensed under the terms of the Gnu Public License.
# With the one additional provision that Ian Jackson's name may not be
# removed from the file.

# Copyright 2026 Vee Satayamas
# Copyright 2019 Andreas Beckmann <anbe@debian.org>
# Copyright 1994,1995 Ian Jackson
# Copyright 2004-2005 Jérôme Marant <jerome@debian.org>
# Copyright 1998-2020, 2022-2023 Rob Browning <rlb@defaultvalue.org>

# Originally copied from the GNU Hello Debian rules file (1.3).
# Modified for emacs by Mark Eichin <eichin@kitten.gen.ma.us>.
# Debhelper support added via one of Joey Hess' example files.
# See the debian/changelog for further historical information.

set -e

EMACS_VERSION=31.1
PACKAGE=emacs-$EMACS_VERSION.tar.xz
URL=https://ftp.gnu.org/gnu/emacs/$PACKAGE

echo Install deps

# fonts-jetbrains-mono is personal preference
su -c 'apt install bsd-mailx \
 ca-certificates \
 dbus-x11 \
 fonts-jetbrains-mono \
 gcc \
 gnupg-agent \
 imagemagick \
 libacl1-dev \
 libasound2-dev \
 libcairo-dev \
 libdbus-1-dev \
 libgccjit-14-dev \
 libgif-dev \
 libgmp-dev \
 libgnutls28-dev \
 libgpm-dev \
 libgtk-3-dev \
 libharfbuzz-dev \
 libjpeg-dev \
 liblcms2-dev \
 liblockfile-dev \
 libm17n-dev \
 libncurses-dev \
 libotf-dev \
 libpng-dev \
 librsvg2-dev \
 libselinux-dev \
 libsqlite3-dev \
 libsystemd-dev \
 libtiff-dev \
 libtree-sitter-dev \
 libwebp-dev \
 libxaw7-dev \
 libxml2-dev \
 procps \
 sharutils \
 texinfo \
 xaw3dg-dev \
 zlib1g-dev'

echo Download
wget $URL -O - | tar -xJf -

cd emacs-$EMACS_VERSION

echo Configure
./configure --prefix=$HOME/.local \
 --with-x=yes \
 --with-x-toolkit=lucid \
 --with-toolkit-scroll-bars \
 --without-gsettings \
 --with-libsystemd \
 --with-pop=yes \
 --with-sound=alsa \
 --without-gconf \
 --with-mailutils

echo Build
make -j $(nproc)

echo Install
make install

cd ..
