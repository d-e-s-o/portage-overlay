# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="List and diff the public API of Rust library crates between releases and commits. Detect breaking API changes and semver violations via CI or a CLI."
HOMEPAGE="https://github.com/cargo-public-api/cargo-public-api"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

BDEPEND="
	dev-lang/rust
"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/cargo-public-api/cargo-public-api.git"
EGIT_COMMIT="v0.52.0"
EGIT_MIN_CLONE_TYPE="shallow"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cargo_src_install --path cargo-public-api/
}
