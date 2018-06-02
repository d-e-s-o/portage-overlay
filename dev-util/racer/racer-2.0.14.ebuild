#/***************************************************************************
# *   Copyright (C) 2017 Daniel Mueller (deso@posteo.net)                   *
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
ansi_term-0.11.0
atty-0.2.8
bitflags-0.7.0
bitflags-1.0.1
cfg-if-0.1.2
clap-2.31.1
clippy-0.0.103
clippy_lints-0.0.103
env_logger-0.5.5
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
humantime-1.1.1
kernel32-sys-0.2.2
lazy_static-1.0.0
libc-0.2.39
log-0.3.9
log-0.4.1
matches-0.1.6
memchr-2.0.1
nom-1.2.4
quick-error-1.2.1
quine-mc_cluskey-0.2.4
racer-2.0.14
rand-0.4.2
redox_syscall-0.1.37
redox_termios-0.1.1
regex-0.2.10
regex-syntax-0.3.9
regex-syntax-0.5.3
rustc-serialize-0.3.24
semver-0.2.3
serde-1.0.36
strsim-0.7.0
syntex_errors-0.52.0
syntex_pos-0.52.0
syntex_syntax-0.52.0
term-0.4.6
termcolor-0.3.5
termion-1.5.1
textwrap-0.9.0
thread_local-0.3.5
toml-0.1.30
toml-0.4.5
ucd-util-0.1.1
unicode-normalization-0.1.5
unicode-width-0.1.4
unicode-xid-0.0.3
unreachable-1.0.0
utf8-ranges-1.0.0
vec_map-0.8.0
void-1.0.2
winapi-0.2.8
winapi-0.3.4
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

# Racer typically needs access to the Rust sources via RUST_SRC_PATH. We
# allow the user to do all that manually but by default we install the
# sources.
RDEPEND="
  rust-sources? ( =dev-lang/rust-sources-1* )
"
DEPEND="
  ${RDEPEND}
"