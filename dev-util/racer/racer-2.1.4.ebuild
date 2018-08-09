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
arrayvec-0.4.7
atty-0.2.10
backtrace-0.3.9
backtrace-sys-0.1.23
bitflags-1.0.3
byteorder-1.2.3
cargo-0.28.0
cc-1.0.18
cfg-if-0.1.4
clap-2.32.0
cmake-0.1.31
commoncrypto-0.2.0
commoncrypto-sys-0.2.0
core-foundation-0.5.1
core-foundation-sys-0.5.1
crates-io-0.16.0
crossbeam-0.3.2
crossbeam-deque-0.2.0
crossbeam-epoch-0.3.1
crossbeam-utils-0.2.2
crypto-hash-0.3.1
curl-0.4.12
curl-sys-0.4.5
derive_more-0.11.0
dtoa-0.4.3
either-1.5.0
ena-0.9.3
env_logger-0.5.10
failure-0.1.1
failure_derive-0.1.1
filetime-0.2.1
flate2-1.0.1
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fs2-0.4.3
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
git2-0.7.2
git2-curl-0.8.1
glob-0.2.11
globset-0.4.0
hex-0.3.2
home-0.3.3
humantime-1.1.1
idna-0.1.5
ignore-0.4.2
itoa-0.4.2
jobserver-0.1.11
kernel32-sys-0.2.2
lazy_static-1.0.1
lazycell-0.6.0
libc-0.2.42
libgit2-sys-0.7.4
libssh2-sys-0.2.7
libz-sys-1.0.18
log-0.4.3
matches-0.1.6
memchr-2.0.1
memoffset-0.2.1
miniz-sys-0.1.10
miow-0.3.1
nodrop-0.1.12
num-traits-0.2.5
num_cpus-1.8.0
openssl-0.10.10
openssl-probe-0.1.2
openssl-sys-0.9.33
owning_ref-0.3.3
parking_lot-0.5.5
parking_lot_core-0.2.14
percent-encoding-1.0.1
pkg-config-0.3.11
proc-macro2-0.3.8
proc-macro2-0.4.6
quick-error-1.2.2
quote-0.3.15
quote-0.5.2
quote-0.6.3
racer-2.1.4
racer-testutils-0.1.0
rand-0.4.2
redox_syscall-0.1.40
redox_termios-0.1.1
regex-0.2.11
regex-1.0.1
regex-syntax-0.5.6
regex-syntax-0.6.1
remove_dir_all-0.5.1
rls-span-0.4.0
rustc-ap-arena-218.0.0
rustc-ap-rustc_cratesio_shim-218.0.0
rustc-ap-rustc_data_structures-218.0.0
rustc-ap-rustc_errors-218.0.0
rustc-ap-rustc_target-218.0.0
rustc-ap-serialize-218.0.0
rustc-ap-syntax-218.0.0
rustc-ap-syntax_pos-218.0.0
rustc-demangle-0.1.8
rustc-hash-1.0.1
rustc-rayon-0.1.1
rustc-rayon-core-0.1.1
rustc_version-0.2.2
same-file-1.0.2
schannel-0.1.13
scoped-tls-0.1.2
scopeguard-0.3.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.70
serde_derive-1.0.70
serde_ignored-0.0.4
serde_json-1.0.22
shell-escape-0.1.4
smallvec-0.6.3
socket2-0.3.7
stable_deref_trait-1.1.0
strsim-0.7.0
syn-0.11.11
syn-0.13.11
syn-0.14.4
synom-0.11.3
synstructure-0.6.1
tar-0.4.16
tempfile-3.0.2
termcolor-0.3.6
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.5
toml-0.4.6
ucd-util-0.1.1
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-width-0.1.5
unicode-xid-0.0.4
unicode-xid-0.1.0
unreachable-1.0.0
url-1.7.1
utf8-ranges-1.0.0
vcpkg-0.2.4
vec_map-0.8.1
void-1.0.2
walkdir-2.1.4
winapi-0.2.8
winapi-0.3.5
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-0.1.6
"

inherit cargo

DESCRIPTION="A code completion utility for Rust"
HOMEPAGE="https://github.com/racer-rust/racer"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+rust-sources"

RUSTVER="20180707"
RUST="rust-bin-${RUSTVER}"
# Racer typically needs access to the Rust sources via RUST_SRC_PATH. We
# allow the user to do all that manually but by default we install the
# sources.
RDEPEND="
  rust-sources? ( =dev-lang/rust-sources-1* )
  =dev-lang/${RUST}
"
DEPEND="
  ${RDEPEND}
"

src_compile() {
	export RUSTC="/usr/bin/rustc-bin-${RUSTVER}"
	export RUSTFLAGS="-L/opt/${RUST}/lib/rustlib/x86_64-unknown-linux-gnu/lib/"

	cargo_src_compile
}
