# Copyright (C) 2017-2026 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="An init script to update the system time using NTP."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm"
IUSE=""

RDEPEND="
  net-misc/netdate
  sys-apps/openrc
"
DEPEND="${RDEPEND}"

src_unpack() {
	# Ensure ${S} exists.
	mkdir -p "${S}"
}

src_install() {
	newinitd "${FILESDIR}"/ntpdate ntpdate
}
