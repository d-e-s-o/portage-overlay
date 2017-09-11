#/***************************************************************************
# *   Copyright (C) 2017 Daniel Mueller (deso@posteo.net)                   *
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

EAPI=5

DESCRIPTION="A default Python venv scaffolding to be shared globally."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 amd64-linux"

PYTHON_COMPAT=( python3_{3,4,5} )
inherit python-single-r1

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

src_unpack() {
  mkdir "${S}"
}

src_prepare() {
  ${PYTHON} -m venv --without-pip --symlinks "${S}/pyvenv" || die
  pushd "${S}/pyvenv" > /dev/null || die
  rmdir include
  rm bin/activate.csh
  rm bin/activate.fish
  rm --recursive lib
  rm --recursive lib64
  epatch "${FILESDIR}/pyvenv-shared-activate.patch"
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