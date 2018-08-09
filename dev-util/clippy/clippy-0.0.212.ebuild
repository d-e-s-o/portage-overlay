#/***************************************************************************
# *   Copyright (C) 2018 Daniel Mueller (deso@posteo.net)                   *
# *                                                                         *
# *   This program is free software: you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation, either version 3 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# *   This program is distributed in the hope that it will be useful,       *
# *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
# *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
# *   GNU General Public License for more details.                          *
# *                                                                         *
# *   You should have received a copy of the GNU General Public License     *
# *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
# ***************************************************************************/

EAPI=6

CRATES="
aho-corasick-0.6.6
ansi_term-0.11.0
backtrace-0.3.9
backtrace-sys-0.1.23
bitflags-0.9.1
cargo_metadata-0.5.8
cc-1.0.18
cfg-if-0.1.4
clippy-0.0.212
clippy-mini-macro-test-0.2.0
clippy_lints-0.0.212
compiletest_rs-0.3.13
derive-new-0.5.5
diff-0.1.11
dtoa-0.4.3
either-1.5.0
error-chain-0.11.0
filetime-0.2.1
getopts-0.2.18
idna-0.1.5
if_chain-0.1.3
itertools-0.7.8
itoa-0.4.2
lazy_static-1.1.0
libc-0.2.43
log-0.4.3
matches-0.1.7
memchr-2.0.1
miow-0.3.1
num-traits-0.2.5
percent-encoding-1.0.1
proc-macro2-0.4.9
pulldown-cmark-0.1.2
quine-mc_cluskey-0.2.4
quote-0.6.5
redox_syscall-0.1.40
regex-1.0.2
regex-syntax-0.6.2
rustc-demangle-0.1.9
rustc_version-0.2.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.71
serde_derive-1.0.71
serde_json-1.0.24
socket2-0.3.7
syn-0.14.7
thread_local-0.3.5
toml-0.4.6
ucd-util-0.1.1
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
url-1.7.1
utf8-ranges-1.0.0
version_check-0.1.4
void-1.0.2
winapi-0.3.5
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo git-r3

EGIT_COMMIT="v0.0.212"
EGIT_REPO_URI="https://github.com/rust-lang-nursery/rust-clippy.git"

DESCRIPTION="A collection of lints to catch common mistakes and improve your Rust code."
HOMEPAGE="https://github.com/rust-lang-nursery/rust-clippy"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RUSTVER="20180707"
RUST="rust-bin-${RUSTVER}"
# Note that we only support dev-lang/rust-bin, not dev-lang/rust.
DEPEND="=dev-lang/${RUST}"
RDEPEND="${DEPEND}"

src_compile() {
	export RUSTC="/usr/bin/rustc-bin-${RUSTVER}"
	export RUSTFLAGS="-L/opt/${RUST}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"

	cargo_src_compile
}

src_install() {
	# For whatever brain dead reason clippy gets fucked up and can't
	# fine some codegen plugin if it resides in /usr/bin/ (alongside
	# rustc and cargo). Instead, move it into the rust-bin directory and
	# symlink it over (to make it still accessible). That makes it
	# invoke the correct rustc.
	cargo install -j $(makeopts_jobs) --root="${D}/opt/${RUST}" --path=. \
			$(usex debug --debug "")\
		|| die "cargo install failed"
	rm -f "${D}/opt/${RUST}/.crates.toml"

	dosym ../../opt/${RUST}/bin/cargo-clippy /usr/bin/cargo-clippy
	dosym ../../opt/${RUST}/bin/clippy-driver /usr/bin/clippy-driver

	# Clippy does not work with the stable compiler (and probably never
	# will), so we need access to the nightly rustc. It will use that
	# automatically (as it got build with it), but it cannot find
	# the Rust runtime libraries. By adjusting RUSTFLAGS we make them
	# known.
	# TODO: This functionality really should be available globally. For
	#       now we only have it here as clippy is the only program
	#       actively using the nightly rustc.
	cat <<-EOF > "${T}"/50${P}
	RUSTFLAGS="-L/opt/${RUST}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"
	EOF
	doenvd "${T}"/50${P}
}
