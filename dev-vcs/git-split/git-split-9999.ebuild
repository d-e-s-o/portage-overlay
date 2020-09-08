# Copyright (C) 2020 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="Simple way to edit in a git commit history."
HOMEPAGE="https://github.com/d-e-s-o/git-split"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
  app-shells/bash
  sys-apps/findutils
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/git-split.git"

inherit git-r3

src_install() {
  exeinto /usr/bin
  doexe git-split
}
