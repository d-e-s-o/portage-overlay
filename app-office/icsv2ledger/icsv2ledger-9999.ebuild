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

DESCRIPTION="Interactive importing of CSV files to Ledger."
HOMEPAGE="https://github.com/quentinsf/icsv2ledger"

SLOT="0"
KEYWORDS="amd64 amd64-linux"

PYTHON_COMPAT=( python3_{4,5,6,7,8} )
inherit python-r1

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_BRANCH="my-patches"
EGIT_REPO_URI="https://github.com/d-e-s-o/icsv2ledger.git"

inherit git-r3

src_install() {
  python_foreach_impl python_doscript icsv2ledger.py
}
