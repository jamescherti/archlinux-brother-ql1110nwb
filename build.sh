#!/usr/bin/env bash

set -euf -o pipefail; IFS=$'\n\t'

if [ "$(id -u)" -eq "0" ]; then
  echo "Error: you cannot run this script as root." >&2
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")"

rm -fr src pkg *.zst *.deb || true
makepkg --printsrcinfo > .SRCINFO
makepkg -f
rm -fr src pkg || true
