#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -fr src pkg *.zst *.deb
makepkg --printsrcinfo > .SRCINFO
makepkg -f
rm -fr pkg src
