# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="network-sandbox userpriv"
IUSE=""

inherit cargo

BDEPEND=""
DEPEND=""
RDEPEND=""

inherit git-r3

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/vmsh.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
}

src_install() {
	cargo_src_install
}
