#/***************************************************************************
# *   Copyright (C) 2017 Daniel Mueller (deso@posteo.net)                   *
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

DESCRIPTION="Utility functionality for rewriting history in a git repository."
HOMEPAGE="https://github.com/d-e-s-o/git-rewritehist"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

RDEPEND="
  =dev-lang/python-3*
  app-shells/bash
  dev-vcs/git
  sys-apps/coreutils
  sys-apps/debianutils
  sys-apps/gawk
  sys-apps/sed
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-rewritehist"

inherit git-r3

src_install() {
  dobin git-sorthist
  dobin git-redatehist
  dobin git-reorderhist
}
