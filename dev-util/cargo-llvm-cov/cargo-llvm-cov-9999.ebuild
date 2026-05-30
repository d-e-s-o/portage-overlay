 # Copyright (C) 2020-2026 Daniel Mueller <deso@posteo.net>
 # SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="Cargo subcommand to easily use LLVM source-based code coverage (-Z instrument-coverage)."

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

RDEPEND="dev-lang/rust"
DEPEND="${RDEPEND}"

RESTRICT="network-sandbox"

inherit git-r3

EGIT_BRANCH="main"
EGIT_COMMIT="7e531da0c6ae171eb018ee77155daf6bc7484674"
EGIT_REPO_URI="https://github.com/taiki-e/cargo-llvm-cov.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
