#/***************************************************************************
# *   Copyright (C) 2016 Daniel Mueller (deso@posteo.net)                   *
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

DESCRIPTION="A script for filtering special files from a list of arbitrary files."
HOMEPAGE="https://github.com/d-e-s-o/file-filter"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

PYTHON_COMPAT=( python3_{4,5,6,7,8} )
inherit python-r1

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/file-filter"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    # We want the installed script to not contain the .py extension, so we
    # cannot use python_doscript which would do all the magic itself but have
    # to invoke the main functionality it provides ourselves.
    python_fix_shebang file-filter/src/deso/filefilter/file-filter.py
    python_newexe file-filter/src/deso/filefilter/file-filter.py file-filter
  }
  python_foreach_impl installation
}
