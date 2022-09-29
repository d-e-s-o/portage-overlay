#/***************************************************************************
# *   Copyright (C) 2017-2018,2021 Daniel Mueller (deso@posteo.net)         *
# *                                                                         *
# *   This program is free software: you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation, either version 3 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# *   This program is distributed in the hope that it will be useful,       *
# *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
# *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
# *   GNU General Public License for more details.                          *
# *                                                                         *
# *   You should have received a copy of the GNU General Public License     *
# *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
# ***************************************************************************/

EAPI=7

DESCRIPTION="A default Python venv scaffolding to be shared globally."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 amd64-linux"

inherit python-single-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_unpack() {
  mkdir "${S}"
}

src_prepare() {
  eapply_user

  ${PYTHON} -m venv --without-pip --symlinks "${S}/pyvenv" || die
  pushd "${S}/pyvenv" > /dev/null || die
  rmdir include
  rm bin/activate.csh
  rm bin/activate.fish
  rm --recursive lib
  rm --recursive lib64
  # We have a bunch of problems here. First, we want to patch a file
  # that is created by the pyvenv module. The file contains an absolute
  # path that effectively can be configured by the user (through portage
  # variables). So the patch we have prepared has the literal string
  # ${S} in it, which we replace with the actual source directory here.
  # Second, in order for this replacement to work we need to copy over
  # the patch into the source directory. The reason is that sed attempts
  # to create a temporary file and the sandboxing mechanism prohibits
  # that from happening in the files directory.
  cp "${FILESDIR}/pyvenv-shared-activate.patch" "${S}/"
  sed --in-place "s!\${S}!${S}!" "${S}/pyvenv-shared-activate.patch"
  epatch "${S}/pyvenv-shared-activate.patch"
  popd > /dev/null || die
  cat > "${S}/pyvenv-shared" <<EOF
#!/bin/sh

if [ \$# != 1 ]; then
  echo "Usage: \${0} <dir>"
  exit 1
fi

for file in /usr/share/pyvenv-shared/*; do
  ln --force --symbolic "\${file}" "\${1}/"
done
EOF
}

src_install() {
  insinto "/usr/share/pyvenv-shared/" || die
  doins -r "${S}/pyvenv"/* || die
  exeinto "/usr/bin/" || die
  doexe "${S}/pyvenv-shared" || die
}
