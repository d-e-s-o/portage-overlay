# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Generates an ebuild for a package using the in-tree eclasses."
HOMEPAGE="https://github.com/cardoe/cargo-ebuild"
LICENSE="Apache-2.0 Boost-1.0 MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

BDEPEND="
	dev-lang/rust
"
DEPEND=""
RDEPEND=""

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/cardoe/cargo-ebuild.git"
EGIT_COMMIT="214594d15b23120f13e02b8be4471dc97ed04bd2"
EGIT_MIN_CLONE_TYPE="shallow"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
