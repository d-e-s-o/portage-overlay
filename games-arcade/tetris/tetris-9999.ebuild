# Copyright (C) 2021 Daniel Mueller <deso@posteo.net>
# SPDX-License-Identifier: GPL-3.0-or-later

EAPI=7

DESCRIPTION="A tetris game."

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	sys-apps/sed
	sys-devel/make
"

RESTRICT="userpriv"

inherit git-r3

EGIT_BRANCH="master"
EGIT_REPO_URI="https://github.com/d-e-s-o/tetris.git"

inherit toolchain-funcs

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	cd ${S}/tetris/build/gmake || die
	emake S= CXX="$(tc-getCXX)" LD="$(tc-getCXX)" tetris || die
}

src_install() {
	exeinto /usr/libexec
	doexe "${S}"/tetris/bin/tetris

	insinto /etc/
	doins "${S}"/tetris/bin/tetris.cfg

	mkdir -p temporary
	cat <<EOF > temporary/tetris
#!/bin/sh
vblank_mode=0 exec /usr/libexec/tetris --use-config=/etc/tetris.cfg "\$@"
EOF
	dobin temporary/tetris

	cat <<EOF > temporary/tetris-vsync
#!/bin/sh
exec /usr/libexec/tetris --use-config=/etc/tetris.cfg "\$@"
EOF
	dobin temporary/tetris-vsync
}
