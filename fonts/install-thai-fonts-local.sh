#!/bin/sh

set -e

target=$HOME/.local/share/fonts/

fonts_tlwg_version=0.7.3
fonts_tlwg_prefix=otf-tlwg
fonts_tlwg_url=https://linux.thai.net/pub/thailinux/software/fonts-tlwg/fonts/${fonts_tlwg_prefix}-${fonts_tlwg_version}.tar.xz

fonts_arundina_version=0.4.0
fonts_arundina_prefix=otf-arundina
fonts_arundina_url=https://linux.thai.net/pub/thailinux/software/fonts-arundina/${fonts_arundina_prefix}-${fonts_arundina_version}.tar.xz

install -d $target

curl -s $fonts_tlwg_url -o - | tar -xJf -
install -t $target ${fonts_tlwg_prefix}-${fonts_tlwg_version}/*.otf

curl -s $fonts_arundina_url -o - | tar -xJf -
install -t $target ${fonts_arundina_prefix}-${fonts_arundina_version}/*.otf
