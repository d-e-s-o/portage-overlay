#/***************************************************************************
# *   Copyright (C) 2018 deso (deso@posteo.net)                             *
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

EAPI=8

DESCRIPTION="Automatic pyvenv detection and activation."
HOMEPAGE="https://github.com/d-e-s-o/pyvenv-auto"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

RDEPEND="
  app-shells/bash
  sys-apps/coreutils
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/pyvenv-auto"

inherit git-r3

src_install() {
  exeinto /usr/bin/
  doexe "${FILESDIR}/python-no-venv"

  insinto /usr/share/pyvenv-auto/
  doins pyvenv-auto.sh
}
