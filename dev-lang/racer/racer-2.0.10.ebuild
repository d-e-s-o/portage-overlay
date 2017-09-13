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

EAPI=5

DESCRIPTION="A code completion utility for Rust"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
HOMEPAGE="https://github.com/racer-rust/racer"
IUSE="+rust-sources"

# Racer typically needs access to the Rust sources via RUST_SRC_PATH. We
# allow the user to do all that manually but by default we install the
# sources.
RDEPEND="
  rust-sources? ( =dev-lang/rust-sources-1.19* )
"
DEPEND="
  >=dev-lang/rust-1.19
  dev-util/cargo
  ${RDEPEND}
"

inherit git-2

EGIT_BRANCH="master"
EGIT_COMMIT="607a64721ce8396baabf57c161150a91a722ad1e"
EGIT_REPO_URI="https://github.com/racer-rust/racer.git"


src_compile() {
  cargo build --release --verbose || die
}

src_install() {
  dobin target/release/racer
}
