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

DESCRIPTION="A script to perform commands on multiple git repositories."
HOMEPAGE="https://github.com/d-e-s-o/git-foreach"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

# Note that really any shell providing /bin/sh should work. app-shell/bash is
# not a strict requirement. There does not seem to be a virtual shell package
# or something similar.
RDEPEND="
  app-shells/bash
  dev-vcs/git
  sys-apps/findutils
  sys-apps/sed
  sys-apps/util-linux
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="devel"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-foreach"

inherit git-2

src_install() {
  exeinto /usr/bin
  doexe git-foreach
}
