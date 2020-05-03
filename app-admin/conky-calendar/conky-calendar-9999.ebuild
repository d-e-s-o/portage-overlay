# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A calendar widget for Conky"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

BDEPEND=""
DEPEND=""
RDEPEND="
	app-admin/conky[truetype]
"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/conky-calendar.git"

src_install() {
	insinto /etc/conky/
	doins "${S}"/calendar.conky
}

pkg_postinst() {
	elog "The calendar widget will not start automatically. To start it "
	elog "put "
	elog "  > conky -d -c /etc/conky/calendar.conky"
	elog "or something similar into your ~/.xsession or other "
	elog "initialization file."
}
