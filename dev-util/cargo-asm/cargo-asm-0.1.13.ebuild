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
ansi_term-0.11.0
assert_cli-0.5.4
atty-0.2.8
backtrace-0.3.5
backtrace-sys-0.1.16
bitflags-0.9.1
bitflags-1.0.1
bytecount-0.2.0
cargo-asm-0.1.13
cargo_metadata-0.3.3
cc-1.0.9
cfg-if-0.1.2
clap-2.31.2
colored-1.6.0
difference-1.0.0
dtoa-0.4.2
edit-distance-2.0.1
environment-0.1.1
error-chain-0.11.0
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
glob-0.2.11
itoa-0.4.1
kernel32-sys-0.2.2
lazy_static-0.2.11
lazy_static-1.0.0
libc-0.2.40
log-0.4.1
num-traits-0.2.2
owning_ref-0.3.3
parking_lot-0.5.4
parking_lot_core-0.2.13
proc-macro2-0.2.3
pulldown-cmark-0.1.2
quote-0.4.2
rand-0.4.2
redox_syscall-0.1.37
redox_termios-0.1.1
remove_dir_all-0.5.0
rustc-demangle-0.1.7
same-file-0.1.3
same-file-1.0.2
semver-0.8.0
semver-parser-0.7.0
serde-1.0.36
serde_derive-1.0.36
serde_derive_internals-0.22.2
serde_json-1.0.13
skeptic-0.13.2
smallvec-0.6.0
stable_deref_trait-1.0.0
strsim-0.7.0
structopt-0.2.6
structopt-derive-0.2.6
syn-0.12.15
tempdir-0.3.7
termcolor-0.3.6
termion-1.5.1
textwrap-0.9.0
unicode-width-0.1.4
unicode-xid-0.1.0
vec_map-0.8.0
walkdir-1.0.7
walkdir-2.1.4
winapi-0.2.8
winapi-0.3.4
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-0.1.6
"

inherit cargo

DESCRIPTION="A cargo subcommand that displays the generated assembly of Rust source code."
HOMEPAGE="https://github.com/gnzlbg/cargo-asm"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT/Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
