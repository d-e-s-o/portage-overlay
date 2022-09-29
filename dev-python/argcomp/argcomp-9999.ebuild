#/***************************************************************************
# *   Copyright (C) 2016,2021 deso (deso@posteo.net)                        *
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

DESCRIPTION="A Python package providing argument completion for programs using ArgumentParser."
HOMEPAGE="https://github.com/d-e-s-o/argcomp"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

inherit python-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="
  dev-python/setuptools[${PYTHON_USEDEP}]
  ${RDEPEND}
"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/argcomp"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    python_moduleinto deso/argcomp
    python_domodule argcomp/src/deso/argcomp/*.py
  }
  python_foreach_impl installation
}
