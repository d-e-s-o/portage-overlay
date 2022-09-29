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

DESCRIPTION="Infrastructure for Python string quotation unification."
HOMEPAGE="https://github.com/d-e-s-o/pystring-fix"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

inherit python-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/pystring-fix"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    # We want the installed script to not contain the .py extension, so we
    # cannot use python_doscript which would do all the magic itself but have
    # to invoke the main functionality it provides ourselves.
    python_fix_shebang pystring-fix/src/deso/pystring/pystring-fix.py
    python_newexe pystring-fix/src/deso/pystring/pystring-fix.py pystring-fix
  }
  python_foreach_impl installation
}
