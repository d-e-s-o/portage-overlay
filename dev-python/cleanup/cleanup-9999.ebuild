#/***************************************************************************
# *   Copyright (C) 2015,2017,2021 deso (deso@posteo.net)                   *
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

DESCRIPTION="A Python module for exception-safe cleanup."
HOMEPAGE="https://github.com/d-e-s-o/cleanup"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"
IUSE="tests"

inherit python-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="
  dev-python/setuptools[${PYTHON_USEDEP}]
  ${RDEPEND}
"

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/cleanup"

inherit git-r3
inherit distutils-r1

src_compile() {
  true
}

src_install() {
  installation() {
    python_moduleinto deso/cleanup
    python_domodule cleanup/src/deso/cleanup/*.py
  }
  python_foreach_impl installation
}
