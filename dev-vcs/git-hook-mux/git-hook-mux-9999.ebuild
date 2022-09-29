#/***************************************************************************
# *   Copyright (C) 2015,2021 deso (deso@posteo.net)                        *
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

DESCRIPTION="A hook multiplexer for git(1)."
HOMEPAGE="https://github.com/d-e-s-o/git-hook-mux"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

inherit python-any-no-clowntown

RDEPEND="
  ${PYTHON_DEPS}
  dev-python/cleanup[${PYTHON_USEDEP}]
  dev-python/execute[${PYTHON_USEDEP}]
  dev-vcs/git
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-hook-mux"

inherit git-r3

src_compile() {
  true
}

src_install() {
  python_foreach_impl python_doscript git-hook-mux/src/deso/git/hook/mux/git-hook-mux.py
}
