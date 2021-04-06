#!/usr/bin/env bash
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#

set -euf -o pipefail; IFS=$'\n\t'

if [ "$(id -u)" -eq "0" ]; then
  echo "Error: you cannot run this script as root." >&2
  exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")"

main() {
  local pkgname="brother-ql1110nwb"
  local release_dir="release-$pkgname"
  makepkg --printsrcinfo > .SRCINFO

  rm -fr "$release_dir"
  git clone "ssh://aur@aur.archlinux.org/$pkgname.git" "$release_dir"
  cp .SRCINFO PKGBUILD brother-ql1110nwb.install "$release_dir/"

  echo
  echo "Success: the release directory '$release_dir' was generated successfully."

  exit 0
}

main "$@"
