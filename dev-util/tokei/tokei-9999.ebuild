# Copyright (C) 2020-2025 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="Count your code, quickly."

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="userpriv network-sandbox"

inherit git-r3

EGIT_BRANCH="master"
EGIT_COMMIT="6f3556bd664c6483661d432a1270b1d2a69b82ec"
EGIT_REPO_URI="https://github.com/XAMPPRocky/tokei.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
