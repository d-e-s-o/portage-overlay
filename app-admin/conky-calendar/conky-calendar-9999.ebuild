# Copyright (C) 2023 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="A calendar widget for Conky"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE="+uhd"

BDEPEND=""
DEPEND=""
RDEPEND="
	app-admin/conky[truetype]
"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/conky-calendar.git"

src_prepare() {
	if use !uhd; then
		eapply "${FILESDIR}/${PN}_-_adjustments_non_uhd.diff" || die
	fi
	eapply_user
}

src_install() {
	insinto /etc/conky/
	doins "${S}"/calendar.conky || die
}

pkg_postinst() {
	elog "The calendar widget will not start automatically. To start it "
	elog "put "
	elog "  > conky -d -c /etc/conky/calendar.conky"
	elog "or something similar into your ~/.xsession or other "
	elog "initialization file."
}
