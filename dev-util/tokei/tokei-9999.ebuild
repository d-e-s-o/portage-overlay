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

DESCRIPTION="XXX"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="userpriv network-sandbox"

inherit git-r3

EGIT_BRANCH="master"
EGIT_COMMIT="7e0b30ff4c1fe78fe2cc615d1f0f52c7ce6cb761"
EGIT_REPO_URI="https://github.com/XAMPPRocky/tokei.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

#src_compile() {
#	cargo build --release --verbose || die
#}

#src_install() {
#	dobin target/release/apcaledge
#
#	cat <<EOF > ${PN}.fish
#alias apledge='/usr/bin/apcapass /usr/bin/apcaledge /home/deso/documents/ledger/registry.json'
#EOF
#
#	insinto /usr/share/fish/vendor_conf.d/
#	insopts -m0755
#	newins ${PN}.fish ${PN}.fish
#}
