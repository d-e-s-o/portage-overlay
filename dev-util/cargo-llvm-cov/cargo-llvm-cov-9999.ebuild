#/***************************************************************************
# *   Copyright (C) 2020 Daniel Mueller (deso@posteo.net)                   *
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

DESCRIPTION="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="userpriv network-sandbox"

inherit git-r3

EGIT_BRANCH="main"
EGIT_COMMIT="30efe472911693470cca4a8491ac3abea73ac423"
EGIT_REPO_URI="https://github.com/taiki-e/cargo-llvm-cov.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}