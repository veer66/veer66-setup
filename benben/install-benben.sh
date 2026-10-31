#!/bin/sh

set -eu

wget https://chiselapp.com/user/MistressRemilia/repository/benben/uv/benben-0.7.1-x86_64.AppImage -O benben
chmod 0755 benben
mv benben ~/.local/bin
