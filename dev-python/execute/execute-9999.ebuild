#/***************************************************************************
# *   Copyright (C) 2015 deso (deso@posteo.net)                             *
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

DESCRIPTION="A Python module for program execution."
HOMEPAGE="https://github.com/d-e-s-o/execute"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

PYTHON_COMPAT=( python3_{4..9} )
inherit python-r1

RDEPEND="dev-python/cleanup[${PYTHON_USEDEP}]"
DEPEND="
  dev-python/setuptools[${PYTHON_USEDEP}]
  ${RDEPEND}
"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/execute"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    python_moduleinto deso/execute
    python_domodule execute/src/deso/execute/*.py
  }
  python_foreach_impl installation
}
