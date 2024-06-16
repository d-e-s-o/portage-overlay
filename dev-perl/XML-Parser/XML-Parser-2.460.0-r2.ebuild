# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=TODDR
DIST_VERSION=2.46
inherit perl-module

DESCRIPTION="A perl module for parsing XML documents"

SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="
	>=dev-libs/expat-1.95.1-r1
"
DEPEND="${RDEPEND}"
BDEPEND="${RDEPEND}"

src_configure() {
	myconf="EXPATLIBPATH=${ESYSROOT}/usr/$(get_libdir) EXPATINCPATH=${ESYSROOT}/usr/include"
	perl-module_src_configure
}

src_install() {
	perl-module_src_install

	# "special" test for bug #827966
	einfo "Checking for Expat.so (bug #827966)"
	find "${D}" -name Expat.so | grep Expat || die "Something went badly wrong, can't find Expat.so. Please file a bug."
}
