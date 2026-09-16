#!/bin/sh

set -xe

su -c 'apt install flatpak plasma-discover-backend-flatpak'
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
