# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake optfeature xdg git-r3

DESCRIPTION="Vim-fork focused on extensibility and agility."
HOMEPAGE="https://neovim.io"

EGIT_REPO_URI="https://github.com/neovim/neovim.git"
EGIT_COMMIT="f6ac375604238c94d3dc3eeb9b82e67417460806"
EGIT_MIN_CLONE_TYPE="shallow"
KEYWORDS="amd64"

LICENSE="Apache-2.0 vim"
SLOT="0"
IUSE="+luajit +nvimpager +tui"

BDEPEND="
	dev-util/gperf
	virtual/libiconv
	virtual/libintl
	virtual/pkgconfig
"
DEPEND="
	dev-libs/libuv:0=
	>=dev-libs/libvterm-0.1.2
	dev-libs/msgpack:0=
	dev-lua/lpeg[luajit=]
	dev-lua/luv[luajit=]
	dev-lua/mpack[luajit=]
	net-libs/libnsl
	luajit? ( dev-lang/luajit:2 )
	!luajit? (
		dev-lang/lua:=
		dev-lua/LuaBitOp
	)
	tui? (
		dev-libs/libtermkey
		>=dev-libs/unibilium-2.0.0:0=
	)
"
RDEPEND="
	${DEPEND}
	app-eselect/eselect-vi
"

CMAKE_BUILD_TYPE=Release

src_prepare() {
	# use our system vim dir
	sed -e "/^# define SYS_VIMRC_FILE/s|\$VIM|${EPREFIX}/etc/vim|" \
		-i src/nvim/globals.h || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DFEAT_TUI=$(usex tui)
		-DPREFER_LUA=$(usex luajit no yes)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	# install a default configuration file
	insinto /etc/vim
	doins "${FILESDIR}"/sysinit.vim

	# conditionally install a symlink for nvimpager
	if use nvimpager; then
		dosym ../share/nvim/runtime/macros/less.sh /usr/bin/nvimpager
	fi
}

pkg_postinst() {
	xdg_pkg_postinst
	optfeature "clipboard support" x11-misc/xsel x11-misc/xclip gui-apps/wl-clipboard
	optfeature "Python plugin support" dev-python/pynvim
	optfeature "Ruby plugin support" dev-ruby/neovim-ruby-client
	optfeature "remote/nvr support" dev-python/neovim-remote
}