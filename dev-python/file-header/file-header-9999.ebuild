#/***************************************************************************
# *   Copyright (C) 2018 Daniel Mueller (deso@posteo.net)                   *
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

DESCRIPTION="A program for checking headers in files."
HOMEPAGE="https://github.com/d-e-s-o/file-header"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

inherit python-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/file-header"

inherit git-r3

src_install() {
  installation() {
    # We want the installed script to not contain the .py extension, so we
    # cannot use python_doscript which would do all the magic itself but have
    # to invoke the main functionality it provides ourselves.
    python_fix_shebang file-header/src/deso/header/file-header.py
    python_newexe file-header/src/deso/header/file-header.py file-header
  }
  python_foreach_impl installation
}
