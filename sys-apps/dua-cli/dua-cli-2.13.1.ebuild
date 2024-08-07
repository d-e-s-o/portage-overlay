# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2-alpha.0

EAPI=8

CRATES="
ansi_term-0.12.1
anyhow-1.0.40
atty-0.2.14
autocfg-1.0.1
bitflags-1.2.1
byte-unit-4.0.12
cassowary-0.3.0
cfg-if-1.0.0
clap-3.0.0-beta.2
clap_derive-3.0.0-beta.2
colored-2.0.0
core-foundation-sys-0.8.2
crossbeam-0.8.1
crossbeam-channel-0.5.1
crossbeam-deque-0.8.0
crossbeam-epoch-0.9.5
crossbeam-queue-0.3.2
crossbeam-utils-0.8.5
crossterm-0.19.0
crossterm_winapi-0.7.0
crosstermion-0.7.0
ctor-0.1.20
diff-0.1.12
doc-comment-0.3.3
dua-cli-2.13.1
either-1.6.1
filesize-0.2.0
fixedbitset-0.2.0
glob-0.3.0
hashbrown-0.9.1
heck-0.3.3
hermit-abi-0.1.18
indexmap-1.6.2
instant-0.1.9
itertools-0.10.0
jwalk-0.6.0
lazy_static-1.4.0
libc-0.2.95
lock_api-0.4.4
log-0.4.14
memoffset-0.6.4
mio-0.7.11
miow-0.3.7
ntapi-0.3.6
num_cpus-1.13.0
numtoa-0.1.0
once_cell-1.7.2
open-1.7.0
os_str_bytes-2.4.0
output_vt100-0.1.2
parking_lot-0.11.1
parking_lot_core-0.8.3
petgraph-0.5.1
pretty_assertions-0.7.2
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.27
quote-1.0.9
rayon-1.5.1
rayon-core-1.9.1
redox_syscall-0.2.8
redox_termios-0.1.2
scopeguard-1.1.0
signal-hook-0.1.17
signal-hook-registry-1.4.0
smallvec-1.6.1
strsim-0.10.0
syn-1.0.72
sysinfo-0.18.2
termcolor-1.1.2
termion-1.5.6
textwrap-0.12.1
tui-0.15.0
tui-react-0.15.0
unicode-segmentation-1.7.1
unicode-width-0.1.8
unicode-xid-0.2.2
utf8-width-0.1.5
vec_map-0.8.2
version_check-0.9.3
which-4.1.0
wild-2.0.4
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="A tool to conveniently learn about the disk usage of directories, fast!"
HOMEPAGE="https://github.com/Byron/dua-cli"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="Apache-2.0 BSD-3-Clause MIT MPL-2.0 Unlicense"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
	cargo_src_configure --no-default-features --features=tui-unix
}
