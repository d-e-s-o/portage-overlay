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

EAPI=6

DESCRIPTION="An init script to update the system time over HTTP."
HOMEPAGE="https://github.com/d-e-s-o/httpdate-openrc"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm"
IUSE=""

RDEPEND="
  net-misc/wget
  sys-apps/coreutils
  sys-apps/openrc
  sys-apps/sed
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/httpdate-openrc.git"

inherit git-r3

src_install() {
	newinitd "${S}"/httpdate httpdate
}
