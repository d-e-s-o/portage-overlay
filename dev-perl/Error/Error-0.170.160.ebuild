# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Error/Error-0.170.160.ebuild,v 1.3 2011/07/30 10:30:01 tove Exp $

# This module is intended to be used by git. It is required because we want git
# to support 'add -i' and 'add -p' commands which require it to be compiled with
# Perl support. However, we do not want all the stupid dependencies from the
# Build-Module stuff, so we omit them here as they appear to be not required for
# this functionality.
EAPI=2

MODULE_AUTHOR=SHLOMIF
MODULE_VERSION=0.17016
inherit perl-module

DESCRIPTION="Error/exception handling in an OO-ish way"

SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~ppc-aix ~x86-fbsd ~x64-freebsd ~x86-freebsd ~x86-interix ~amd64-linux ~ia64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	test? ( >=dev-perl/Test-Pod-1.14
		>=dev-perl/Test-Pod-Coverage-1.04 )"

SRC_TEST="do"
