# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A syntax-highlighter for git and diff output"
HOMEPAGE="https://github.com/dandavison/delta"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

BDEPEND="
	>=dev-lang/rust-1.38.0
"
DEPEND=""
RDEPEND="${DEPEND}"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/dandavison/delta.git"
EGIT_MIN_CLONE_TYPE="shallow"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
