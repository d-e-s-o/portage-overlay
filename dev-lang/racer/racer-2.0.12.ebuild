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
aho-corasick-0.5.3
ansi_term-0.9.0
atty-0.2.2
bitflags-0.7.0
bitflags-0.9.1
clap-2.26.2
clippy-0.0.103
clippy_lints-0.0.103
conv-0.3.3
custom_derive-0.1.7
env_logger-0.3.5
kernel32-sys-0.2.2
lazy_static-0.2.8
libc-0.2.31
log-0.3.8
magenta-0.1.1
magenta-sys-0.1.1
matches-0.1.6
memchr-0.1.11
nom-1.2.4
quine-mc_cluskey-0.2.4
racer-2.0.12
rand-0.3.16
regex-0.1.80
regex-syntax-0.3.9
rustc-serialize-0.3.24
semver-0.2.3
strsim-0.6.0
syntex_errors-0.52.0
syntex_pos-0.52.0
syntex_syntax-0.52.0
term-0.4.6
term_size-0.3.0
textwrap-0.8.0
thread-id-2.0.0
thread_local-0.2.7
toml-0.1.30
toml-0.2.1
unicode-normalization-0.1.5
unicode-width-0.1.4
unicode-xid-0.0.3
utf8-ranges-0.1.3
vec_map-0.8.0
winapi-0.2.8
winapi-build-0.1.1
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
