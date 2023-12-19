# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A program for deploying chroot environments."
HOMEPAGE="https://github.com/d-e-s-o/chroot-deploy"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cargo
RDEPEND="
  app-shells/bash
  sys-apps/util-linux
"
DEPEND="${RDEPEND}"

inherit git-r3

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/chroot-deploy.git"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	cargo_src_compile
	# Install shell-complete binary into source directory to be able to
	# use it later on.
	cargo install --bin=shell-complete --features=clap_complete --path . --root "${S}" || die
}

src_install() {
	cargo_src_install

	"${S}"/bin/shell-complete fish > ${PN}.fish || die
	insinto /usr/share/fish/vendor_conf.d/
	insopts -m0755
	newins ${PN}.fish ${PN}.fish
}
