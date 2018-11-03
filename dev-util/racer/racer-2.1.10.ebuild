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
bitflags-1.0.3
byteorder-1.2.3
cfg-if-0.1.4
clap-2.32.0
cloudabi-0.0.3
crossbeam-deque-0.2.0
crossbeam-epoch-0.3.1
crossbeam-utils-0.2.2
derive_more-0.13.0
either-1.5.0
ena-0.9.3
env_logger-0.5.10
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
humantime-1.1.1
itoa-0.4.3
lazy_static-1.0.1
lazycell-1.0.0
libc-0.2.42
lock_api-0.1.3
log-0.4.3
memchr-2.0.1
memoffset-0.2.1
nodrop-0.1.12
num_cpus-1.8.0
owning_ref-0.3.3
parking_lot-0.6.4
parking_lot_core-0.2.14
parking_lot_core-0.3.1
proc-macro2-0.4.20
quick-error-1.2.2
quote-0.6.3
racer-2.1.10
racer-cargo-metadata-0.1.1
racer-interner-0.1.0
racer-testutils-0.1.0
rand-0.4.2
rand-0.5.5
rand_core-0.2.1
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.1
regex-syntax-0.6.1
remove_dir_all-0.5.1
rls-span-0.4.0
rustc-ap-arena-274.0.0
rustc-ap-rustc_cratesio_shim-274.0.0
rustc-ap-rustc_data_structures-274.0.0
rustc-ap-rustc_errors-274.0.0
rustc-ap-rustc_target-274.0.0
rustc-ap-serialize-274.0.0
rustc-ap-syntax-274.0.0
rustc-ap-syntax_pos-274.0.0
rustc-hash-1.0.1
rustc-rayon-0.1.1
rustc-rayon-core-0.1.1
rustc_version-0.2.2
ryu-0.2.6
scoped-tls-0.1.2
scopeguard-0.3.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.80
serde_derive-1.0.80
serde_json-1.0.32
smallvec-0.6.5
stable_deref_trait-1.1.0
strsim-0.7.0
syn-0.15.17
tempfile-3.0.2
termcolor-0.3.6
termcolor-1.0.4
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.5
ucd-util-0.1.1
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
utf8-ranges-1.0.0
vec_map-0.8.1
void-1.0.2
winapi-0.3.5
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-0.1.6
wincolor-1.0.1
"

inherit cargo

DESCRIPTION="Code completion for Rust"
HOMEPAGE="https://github.com/racer-rust/racer"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE="+rust-sources"

RUSTVER="20181103"
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
