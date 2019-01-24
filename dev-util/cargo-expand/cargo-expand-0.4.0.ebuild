# Copyright 2017-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.5

EAPI=6

CRATES="
adler32-1.0.3
aho-corasick-0.6.9
ansi_colours-1.0.1
ansi_term-0.11.0
atty-0.2.11
autocfg-0.1.1
backtrace-0.3.13
backtrace-sys-0.1.28
base64-0.9.3
bincode-1.0.1
bitflags-1.0.4
build_const-0.2.1
byteorder-1.2.7
cargo-expand-0.4.0
cc-1.0.28
cfg-if-0.1.6
clap-2.32.0
clicolors-control-0.2.0
cloudabi-0.0.3
console-0.6.2
content_inspector-0.2.4
crc-1.8.1
crc32fast-1.1.2
curl-sys-0.4.16
darling-0.8.1
darling_core-0.8.1
darling_macro-0.8.1
derive_builder-0.7.0
derive_builder_core-0.4.0
directories-1.0.2
encoding-0.2.33
encoding-index-japanese-1.20141219.5
encoding-index-korean-1.20141219.5
encoding-index-simpchinese-1.20141219.5
encoding-index-singlebyte-1.20141219.5
encoding-index-tradchinese-1.20141219.5
encoding_index_tests-0.1.4
error-chain-0.12.0
flate2-1.0.6
fnv-1.0.6
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
git2-0.7.5
heck-0.3.1
humantime-1.2.0
ident_case-1.0.0
idna-0.1.5
itoa-0.4.3
kernel32-sys-0.2.2
lazy_static-0.2.11
lazy_static-1.2.0
lazycell-1.2.1
libc-0.2.46
libgit2-sys-0.7.11
libssh2-sys-0.2.11
libz-sys-1.0.25
linked-hash-map-0.5.1
lock_api-0.1.5
log-0.4.6
matches-0.1.8
memchr-2.1.2
miniz-sys-0.1.11
miniz_oxide-0.2.0
miniz_oxide_c_api-0.2.0
onig-4.3.1
onig_sys-69.1.0
openssl-probe-0.1.2
openssl-sys-0.9.40
owning_ref-0.4.0
parking_lot-0.7.1
parking_lot_core-0.4.0
percent-encoding-1.0.1
pkg-config-0.3.14
plist-0.3.0
prettyprint-0.2.0
proc-macro2-0.4.24
quick-error-1.2.2
quote-0.6.10
rand-0.6.4
rand_chacha-0.1.1
rand_core-0.3.0
rand_hc-0.1.0
rand_isaac-0.1.1
rand_os-0.1.1
rand_pcg-0.1.1
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.50
redox_termios-0.1.1
regex-1.1.0
regex-syntax-0.6.4
remove_dir_all-0.5.1
rustc-demangle-0.1.13
rustc_version-0.2.3
ryu-0.2.7
safemem-0.3.0
same-file-1.0.4
scopeguard-0.3.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.84
serde_derive-1.0.84
serde_json-1.0.35
shell-words-0.1.0
smallvec-0.6.7
stable_deref_trait-1.1.1
strsim-0.7.0
structopt-0.2.14
structopt-derive-0.2.14
syn-0.15.24
syntect-3.0.2
tempfile-3.0.5
termion-1.5.1
termios-0.3.1
textwrap-0.10.0
thread_local-0.3.6
ucd-util-0.1.3
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-segmentation-1.2.1
unicode-width-0.1.5
unicode-xid-0.1.0
unreachable-1.0.0
url-1.7.2
utf8-ranges-1.0.2
vcpkg-0.2.6
vec_map-0.8.1
version_check-0.1.5
void-1.0.2
walkdir-2.2.7
winapi-0.2.8
winapi-0.3.6
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.1
winapi-x86_64-pc-windows-gnu-0.4.0
xml-rs-0.7.0
yaml-rust-0.4.2
"

inherit cargo

DESCRIPTION="Wrapper around rustc --pretty=expanded. Shows the result of macro expansion and #[derive] expansion."
HOMEPAGE="https://github.com/dtolnay/cargo-expand"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT/Apache-2.0" # Update to proper Gentoo format
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
