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

DESCRIPTION="A program aiding in providing auto-completion for pass (1)."
HOMEPAGE="https://github.com/d-e-s-o/pass-complete"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"
IUSE="module"

PYTHON_COMPAT=( python3_{2,3,4} )
inherit python-r1

RDEPEND="app-admin/pass"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/pass-complete"

inherit git-2

src_compile() {
  true
}

src_install() {
  installation() {
    python_fix_shebang src/passcomp/pass-complete.py
    if use module; then
      python_moduleinto passcomp
      python_domodule src/passcomp/*.py
    fi
    # TODO: Ideally, we would like to create a symlink from
    #       $(python_get_sitedir)/passcomp/pass-complete.py into the
    #       destination directory.
    python_newexe src/passcomp/pass-complete.py pass-complete
  }
  python_foreach_impl installation
}
