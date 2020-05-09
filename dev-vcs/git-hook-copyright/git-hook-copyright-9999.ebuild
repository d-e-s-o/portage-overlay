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

EAPI=6

DESCRIPTION="A pre-commit hook for handling copyright headers hook in git(1)."
HOMEPAGE="https://github.com/d-e-s-o/git-hook-copyright"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

PYTHON_COMPAT=( python3_{4,5,6,7,8} )
inherit python-r1

RDEPEND="
  ${PYTHON_DEPS}
  dev-python/cleanup[${PYTHON_USEDEP}]
  dev-python/execute[${PYTHON_USEDEP}]
  dev-python/copyright[${PYTHON_USEDEP}]
  dev-vcs/git
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-hook-copyright"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    python_moduleinto deso/git/hook/copyright
    python_domodule git-hook-copyright/src/deso/git/hook/copyright/__init__.py
    python_doscript git-hook-copyright/src/deso/git/hook/copyright/git-hook-copyright.py
  }
  python_foreach_impl installation
}
