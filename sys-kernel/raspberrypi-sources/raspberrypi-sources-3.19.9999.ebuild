# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ETYPE=sources
K_DEFCONFIG="bcmrpi_defconfig"
K_SECURITY_UNSUPPORTED=1
EXTRAVERSION="-${PN}/-*"
inherit kernel-2
detect_version
detect_arch

inherit git-r3
EGIT_REPO_URI=https://github.com/raspberrypi/linux.git
EGIT_BRANCH="rpi-3.19.y"
EGIT_MIN_CLONE_TYPE="shallow"

DESCRIPTION="Raspberry PI kernel sources"
HOMEPAGE="https://github.com/raspberrypi/linux"

KEYWORDS=""

src_unpack() {
	git-r3_src_unpack
	mv ${WORKDIR}/raspberrypi-sources-${PV} ${WORKDIR}/linux-${PV}-raspberrypi || die
	unpack_set_extraversion
	# There is probably a better way to exclude git meta data from being
	# installed, but that's what we have...
	rm -r ${WORKDIR}/linux-${PV}-raspberrypi/.git* || die
}
