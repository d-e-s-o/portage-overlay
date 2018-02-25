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
aho-corasick-0.6.4
backtrace-0.3.5
backtrace-sys-0.1.16
bitflags-0.7.0
bitflags-0.9.1
cargo_metadata-0.2.3
cc-1.0.4
cfg-if-0.1.2
clippy-0.0.186
clippy-mini-macro-test-0.2.0
clippy_lints-0.0.186
compiletest_rs-0.3.6
diff-0.1.11
dtoa-0.4.2
duct-0.8.2
either-1.4.0
error-chain-0.8.1
filetime-0.1.15
getopts-0.2.17
idna-0.1.4
if_chain-0.1.2
itertools-0.6.5
itoa-0.3.4
kernel32-sys-0.2.2
lazy_static-1.0.0
lazycell-0.5.1
libc-0.2.36
log-0.3.9
log-0.4.1
matches-0.1.6
memchr-2.0.1
miow-0.2.1
net2-0.2.31
nix-0.8.1
num-traits-0.1.43
num-traits-0.2.0
os_pipe-0.5.1
percent-encoding-1.0.1
pulldown-cmark-0.0.15
quine-mc_cluskey-0.2.4
quote-0.3.15
redox_syscall-0.1.37
regex-0.2.6
regex-syntax-0.4.2
rustc-demangle-0.1.6
rustc-serialize-0.3.24
semver-0.6.0
semver-parser-0.7.0
serde-1.0.27
serde_derive-1.0.27
serde_derive_internals-0.19.0
serde_json-1.0.9
shared_child-0.2.1
syn-0.11.11
synom-0.11.3
thread_local-0.3.5
toml-0.4.5
unicode-bidi-0.3.4
unicode-normalization-0.1.5
unicode-xid-0.0.4
unreachable-1.0.0
url-1.7.0
utf8-ranges-1.0.0
void-1.0.2
winapi-0.2.8
winapi-0.3.4
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
ws2_32-sys-0.2.1
"

inherit cargo git-r3

EGIT_COMMIT="v0.0.186"
EGIT_REPO_URI="https://github.com/rust-lang-nursery/rust-clippy.git"

DESCRIPTION="A collection of lints to catch common mistakes and improve your Rust code."
HOMEPAGE="https://github.com/rust-lang-nursery/rust-clippy"
SRC_URI="$(cargo_crate_uris ${CRATES})"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# Note that we only support dev-lang/rust-bin, not dev-lang/rust.
DEPEND="=dev-lang/rust-bin-9999"
RDEPEND="${DEPEND}"

src_compile() {
	export RUSTC="/usr/bin/rustc-bin-9999"
	export RUSTFLAGS="-L/opt/rust-bin-9999/lib/rustlib/x86_64-unknown-linux-gnu/lib/"

	cargo_src_compile
}

src_install() {
	cargo_src_install

	# Clippy does not work with the stable compiler (and probably never
	# will), so we need access to the nightly rustc. It will use that
	# automatically (as it got build with it), but it cannot find
	# the Rust runtime libraries. By adjusting RUSTFLAGS we make them
	# known.
	# TODO: This functionality really should be available globally. For
	#       now we only have it here as clippy is the only program
	#       actively using the nightly rustc.
	cat <<-EOF > "${T}"/50${P}
	RUSTFLAGS="-L/opt/rust-bin-9999/lib/rustlib/x86_64-unknown-linux-gnu/lib/"
	EOF
	doenvd "${T}"/50${P}
}
