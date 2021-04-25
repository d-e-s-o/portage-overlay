# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils

DESCRIPTION="SLiM (Simple Login Manager) themes pack"
HOMEPAGE="https://sourceforge.net/projects/slim.berlios/"
SRC_URI="mirror://sourceforge/project/slim.berlios/slim-1.2.3-themepack1a.tar.gz
	mirror://gentoo/slim-gentoo-1.0.tar.bz2
	http://www.xfce-look.org/CONTENT/content-files/48605-xfce-g-box-slim-0.1.tar.gz
	http://www.konstantinhansen.de/source/slim_themes/gentoo_10_blue/gentoo_10_blue.tar.bz2 -> gentoo_10_blue-r1.tar.bz2
	https://github.com/d-e-s-o/gentoo-wallpaper/archive/master.zip -> gentoo-wallpaper.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm ~mips ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="+uhd"

RDEPEND="x11-misc/slim"
DEPEND="
	!x11-themes/simple-themes
	media-gfx/imagemagick[png]
"

RESTRICT="strip binchecks"

S="${WORKDIR}"

src_prepare() {
	mv gentoo-wallpaper-master/wallpaper.png gentoo/background.png || die "failed to mv wallpaper.png"
	rm -rf gentoo-wallpaper-master || die "failed to rm gentoo-wallpaper-master"

	if use uhd; then
		epatch "${FILESDIR}/${PN}_-_adjustments_uhd.diff"
	else
		epatch "${FILESDIR}/${PN}_-_adjustments.diff"
		mogrify -resize '1920x' -crop '1920x1080+0+180' gentoo/background.png || die "mogrify failed"
	fi
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
