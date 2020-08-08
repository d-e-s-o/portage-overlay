# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Easy support for interacting between JS and Rust."
HOMEPAGE="https://github.com/rustwasm/wasm-bindgen"
LICENSE="Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSD-3-Clause BSL-1.0 CC0-1.0 ISC MIT Unlicense Zlib"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo

BDEPEND="
	dev-lang/rust
"
DEPEND=""
RDEPEND="
	${DEPEND}
	net-libs/nodejs
"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/rustwasm/wasm-bindgen.git"
EGIT_COMMIT="0.2.67"
EGIT_MIN_CLONE_TYPE="shallow"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	cd crates/cli && cargo_src_install --bin=wasm-bindgen-test-runner
}
