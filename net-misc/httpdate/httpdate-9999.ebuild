# Copyright (C) 2017-2026 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="An init script to update the system time over HTTP."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm"
IUSE=""

RDEPEND="
  net-misc/curl
  sys-apps/coreutils
  sys-apps/openrc
  sys-apps/sed
"
DEPEND="${RDEPEND}"

src_unpack() {
	# Ensure ${S} exists.
	mkdir -p "${S}"
}

src_install() {
	newinitd "${FILESDIR}"/httpdate httpdate
}
