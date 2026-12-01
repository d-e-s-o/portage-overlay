# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="$(ver_rs 3 a)"

DESCRIPTION="A fork of password-store using age as encryption backend"
HOMEPAGE="https://github.com/FiloSottile/passage"
SRC_URI="https://github.com/FiloSottile/${PN}/archive/refs/tags/${MY_PV}.tar.gz"

S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

IUSE="wayland git"

RDEPEND="
	app-crypt/rage
	app-shells/bash
	>=app-text/tree-1.7.0
	sys-apps/coreutils
	wayland? ( gui-apps/wl-clipboard )
	git? ( dev-vcs/git )
"

src_prepare() {
	default

	for patch in "${FILESDIR}"/*.patch; do
		eapply "$patch"
	done
}

src_install() {
	default

	mv "${ED}"/usr/share/fish/vendor_completions.d/passage.fish "${ED}"/usr/share/fish/vendor_completions.d/pass.fish

	cat <<-'EOF' > pass
	#!/usr/bin/env sh
	PASSAGE_AGE="age-gpg" passage "$@"
	EOF

	exeinto /usr/bin/
	newexe pass pass
	newexe ${FILESDIR}/age-gpg age-gpg
}
