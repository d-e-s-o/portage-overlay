# Copyright (C) 2021-2025 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="Scripts for URL encoding and decoding."
HOMEPAGE="https://github.com/d-e-s-o/urlencode"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

inherit python-any-no-clowntown

EGIT_BRANCH="main"
EGIT_REPO_URI="https://github.com/d-e-s-o/urlencode.git"

inherit git-r3

src_install() {
  exeinto /usr/bin
  doexe urlencode
  doexe urldecode
}
