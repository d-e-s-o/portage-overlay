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

DESCRIPTION="A script providing sub-repository functionality for git(1)."
HOMEPAGE="https://github.com/d-e-s-o/git-subrepo"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

PYTHON_COMPAT=( python3_{2,3,4} )
inherit python-r1

RDEPEND="
  ${PYTHON_DEPS}
  dev-python/cleanup[${PYTHON_USEDEP}]
  dev-python/execute[${PYTHON_USEDEP}]
  dev-vcs/git
  sys-apps/coreutils
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-subrepo"

inherit git-2

src_compile() {
  true
}

src_install() {
  installation() {
    # We want the installed script to not contain the .py extension, so
    # we cannot use python_doscript which would do all the magic itself
    # but have to invoke the main functionality it provides ourselves.
    # TODO: Ideally, we would like to create a symlink from
    #       $(python_get_sitedir)/../git-subrepo.py into the destination
    #       directory. However, this does not work.
    python_fix_shebang git-subrepo/src/deso/git/subrepo/git-subrepo.py
    python_newexe git-subrepo/src/deso/git/subrepo/git-subrepo.py git-subrepo
  }
  python_foreach_impl installation
}
