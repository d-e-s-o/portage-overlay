# Copyright (C) 2019-2020 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=8

DESCRIPTION="Simple way to edit in a git commit history."
HOMEPAGE="https://github.com/ridiculousfish/git-prev-next"

LICENSE="CC0"
SLOT="0"
KEYWORDS="amd64"

# Note that really any shell providing /bin/sh should work. app-shell/bash is
# not a strict requirement. There does not seem to be a virtual shell package
# or something similar.
RDEPEND="
  app-shells/bash
  dev-vcs/git
  sys-apps/findutils
  sys-apps/sed
  sys-apps/util-linux
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/ridiculousfish/git-prev-next.git"
EGIT_COMMIT="1d8daa240f4737cba6a8d8edc9c6200924e73e23"

inherit git-r3

src_install() {
  exeinto /usr/bin
  doexe git-prev
  doexe git-next
}
