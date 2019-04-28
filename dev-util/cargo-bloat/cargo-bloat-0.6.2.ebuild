# Copyright 2017-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.5

EAPI=6

CRATES="
adler32-1.0.3
aho-corasick-0.6.9
ansi_term-0.11.0
atty-0.2.11
bitflags-1.0.4
build_const-0.2.1
cargo-bloat-0.6.2
cc-1.0.25
cfg-if-0.1.6
clap-2.32.0
crc-1.8.1
flate2-1.0.4
goblin-0.0.19
heck-0.3.0
itoa-0.4.3
kernel32-sys-0.2.2
lazy_static-1.1.0
libc-0.2.43
log-0.4.6
memchr-2.1.1
memmap-0.7.0
miniz-sys-0.1.11
miniz_oxide-0.2.0
miniz_oxide_c_api-0.2.0
multimap-0.4.0
object-0.11.0
plain-0.2.3
proc-macro2-0.4.20
quote-0.6.9
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.5
regex-syntax-0.6.2
rustc-demangle-0.1.9
rustc_version-0.2.3
ryu-0.2.6
scroll-0.9.2
scroll_derive-0.9.5
semver-0.9.0
semver-parser-0.7.0
serde-1.0.80
serde_derive-1.0.80
serde_json-1.0.32
strsim-0.7.0
structopt-0.2.13
structopt-derive-0.2.13
syn-0.15.17
term_size-0.3.1
termion-1.5.1
textwrap-0.10.0
thread_local-0.3.6
ucd-util-0.1.2
unicode-segmentation-1.2.1
unicode-width-0.1.5
unicode-xid-0.1.0
utf8-ranges-1.0.2
uuid-0.7.1
vec_map-0.8.1
version_check-0.1.5
winapi-0.2.8
winapi-0.3.6
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Find out what takes most of the space in your executable."
HOMEPAGE="https://github.com/RazrFalcon/cargo-bloat"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT" # Update to proper Gentoo format
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""