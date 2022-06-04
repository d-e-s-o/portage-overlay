# Copyright (C) 2021 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="Scripts for URL encoding and decoding."
HOMEPAGE="https://github.com/d-e-s-o/urlencode"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

PYTHON_COMPAT=( python3_{8..10} )
inherit python-r1

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/urlencode.git"

inherit git-r3

src_install() {
  exeinto /usr/bin
  doexe urlencode
  doexe urldecode
}
