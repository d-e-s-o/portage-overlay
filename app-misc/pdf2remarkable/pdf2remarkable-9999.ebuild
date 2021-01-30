# Copyright (C) 2020 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="A script to transfer PDF files to the reMarkable tablet."
HOMEPAGE="https://github.com/adaerr/reMarkableScripts"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="
	sys-apps/util-linux
	media-gfx/imagemagick
"
DEPEND="${RDEPEND}"

EGIT_BRANCH="master"
EGIT_COMMIT="ab902841990c668bfe5a96400be431b234b84c11"
EGIT_REPO_URI="https://github.com/adaerr/reMarkableScripts.git"

inherit git-r3

src_install() {
	exeinto /usr/bin
	doexe pdf2remarkable.sh
}
