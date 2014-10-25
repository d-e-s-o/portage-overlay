# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/slim-themes/slim-themes-1.2.3a-r6.ebuild,v 1.6 2013/08/22 18:34:49 axs Exp $

EAPI=2
inherit eutils

DESCRIPTION="SLiM (Simple Login Manager) themes pack"
HOMEPAGE="http://slim.berlios.de"
SRC_URI="mirror://berlios/slim/slim-1.2.3-themepack1a.tar.gz
	mirror://gentoo/slim-gentoo-1.0.tar.bz2
	http://www.xfce-look.org/CONTENT/content-files/48605-xfce-g-box-slim-0.1.tar.gz
	http://www.konstantinhansen.de/source/slim_themes/gentoo_10_blue/gentoo_10_blue.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE=""

RDEPEND="x11-misc/slim"
DEPEND="!x11-themes/simple-themes"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_prepare() {
	epatch "${FILESDIR}/${PN}_-_adjustments.diff"
}

src_compile() {
	:
}

src_install() {
	for i in capernoited flower2 gentoo_10_{blue,dark,purple} isolated \
		lotus-{sage,midnight} mindlock parallel-dimensions slim-archlinux \
		subway xfce-g-box Zenwalk ; do
		rm -rf ${i}
	done

	rm gentoo/README || die "rm README"

	local themesdir="/usr/share/slim/themes"
	insinto ${themesdir}
	doins -r .
}
