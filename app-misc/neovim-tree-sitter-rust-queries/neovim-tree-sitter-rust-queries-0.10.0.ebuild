# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Conceptually
# https://github.com/tree-sitter/tree-sitter-rust/tree/master/queries
# contains queries as well, but the hightlighting seems more basic
# (though not necessarily worse) and folding is missing entirely.
SRC_URI="
  https://github.com/nvim-treesitter/nvim-treesitter/archive/refs/tags/v0.10.0.tar.gz
"

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
	default
	mkdir -p ${S}
}

src_install() {
	insinto /usr/share/nvim/runtime/queries/rust
	doins ${WORKDIR}/nvim-treesitter-0.10.0/queries/rust/folds.scm
	doins ${WORKDIR}/nvim-treesitter-0.10.0/queries/rust/highlights.scm
}
