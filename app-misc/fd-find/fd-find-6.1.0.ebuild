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
ansi_term-0.10.2
ansi_term-0.9.0
atty-0.2.3
bitflags-0.7.0
bitflags-1.0.1
cfg-if-0.1.2
clap-2.29.0
crossbeam-0.2.10
ctrlc-3.0.3
diff-0.1.11
fd-find-6.1.0
fnv-1.0.6
fuchsia-zircon-0.2.1
fuchsia-zircon-sys-0.2.0
globset-0.2.1
ignore-0.2.2
kernel32-sys-0.2.2
lazy_static-0.2.11
lazy_static-1.0.0
libc-0.2.34
log-0.3.8
memchr-1.0.2
memchr-2.0.1
nix-0.8.1
num_cpus-1.7.0
rand-0.3.18
redox_syscall-0.1.32
redox_termios-0.1.1
regex-0.2.3
regex-syntax-0.4.1
same-file-0.1.3
strsim-0.6.0
tempdir-0.3.5
termion-1.5.1
textwrap-0.9.0
thread_local-0.3.5
unicode-width-0.1.4
unreachable-1.0.0
utf8-ranges-1.0.0
vec_map-0.8.0
version_check-0.1.3
void-1.0.2
walkdir-1.0.7
winapi-0.2.8
winapi-build-0.1.1
"

inherit cargo

DESCRIPTION="A simple, fast and user-friendly alternative to find."
HOMEPAGE="https://github.com/sharkdp/fd"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT/Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
