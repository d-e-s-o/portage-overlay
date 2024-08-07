# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/alsaequal/alsaequal-0.6-r2.ebuild,v 1.4 2014/08/10 12:59:02 nativemad Exp $

EAPI=8
inherit multilib toolchain-funcs multilib-minimal

DESCRIPTION="a real-time adjustable equalizer plugin for ALSA"
HOMEPAGE="http://www.thedigitalmachine.net/alsaequal.html"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=">=media-libs/alsa-lib-1.0.27.2[${MULTILIB_USEDEP}]
	>=media-plugins/caps-plugins-0.9.15[${MULTILIB_USEDEP}]
	abi_x86_32? ( !<=app-emulation/emul-linux-x86-soundlibs-20130224-r3
					!app-emulation/emul-linux-x86-soundlibs[-abi_x86_32(-)] )"
DEPEND="${RDEPEND}"

S=${WORKDIR}/${PN}
DOCS=( README )

src_unpack() {
	unpack "${FILESDIR}"/${P}.tar.bz2
}

src_prepare() {
	eapply_user
	eapply "${FILESDIR}"/${P}-asneeded.patch
	eapply "${FILESDIR}"/${P}-eq-name.patch
	eapply "${FILESDIR}"/${P}-fix-mixer-open-issue.patch
	eapply "${FILESDIR}"/${P}-fix-lib-path.patch
	multilib_copy_sources
}

multilib_src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} -Wall -fPIC -DPIC" \
		LD="$(tc-getCC)" \
		LDFLAGS="${LDFLAGS} -shared" \
		Q= \
		SND_PCM_LIBS="-lasound" \
		SND_CTL_LIBS="-lasound" || die
}

multilib_src_install() {
	exeinto /usr/$(get_libdir)/alsa-lib
	doexe *.so || die
}
