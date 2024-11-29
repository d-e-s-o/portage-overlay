# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A program for deploying chroot environments."
HOMEPAGE="https://github.com/d-e-s-o/fzy-tmux"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo
RDEPEND="
  app-misc/tmux
  app-text/fzy
"
DEPEND="${RDEPEND}"

inherit git-r3

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/fzy-tmux.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}
