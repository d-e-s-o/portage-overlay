# Copyright (C) 2020 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="A simple Python HTTP server and module."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"

inherit python-any-no-clowntown

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/httpsrv.git"

inherit git-r3

src_compile() {
  true
}

src_install() {
  installation() {
    # We want the installed script to not contain the .py extension, so we
    # cannot use python_doscript which would do all the magic itself but have
    # to invoke the main functionality it provides ourselves.
    python_fix_shebang src/deso/httpsrv/httpsrv.py
    python_newexe src/deso/httpsrv/httpsrv.py httpsrv
  }
  python_foreach_impl installation

  newinitd "${FILESDIR}"/httpsrv httpsrv
}
