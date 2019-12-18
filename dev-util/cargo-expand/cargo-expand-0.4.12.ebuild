# Copyright 2017-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.1.5

EAPI=6

CRATES="
adler32-1.0.3
aho-corasick-0.7.3
ansi_colours-1.0.1
ansi_term-0.11.0
argon2rs-0.2.5
arrayvec-0.4.10
atty-0.2.11
autocfg-0.1.2
backtrace-0.3.15
backtrace-sys-0.1.28
base64-0.10.1
bincode-1.1.3
bitflags-1.0.4
blake2-rfc-0.2.18
build_const-0.2.1
byteorder-1.3.1
cargo-expand-0.4.12
cc-1.0.35
cfg-if-0.1.7
clap-2.33.0
clicolors-control-1.0.0
cloudabi-0.0.3
console-0.7.5
constant_time_eq-0.1.3
content_inspector-0.2.4
crc-1.8.1
crc32fast-1.2.0
darling-0.8.6
darling_core-0.8.6
darling_macro-0.8.6
derive_builder-0.7.1
derive_builder_core-0.4.1
directories-1.0.2
dirs-1.0.5
encode_unicode-0.3.5
encoding-0.2.33
encoding-index-japanese-1.20141219.5
encoding-index-korean-1.20141219.5
encoding-index-simpchinese-1.20141219.5
encoding-index-singlebyte-1.20141219.5
encoding-index-tradchinese-1.20141219.5
encoding_index_tests-0.1.4
error-chain-0.12.0
failure-0.1.5
failure_derive-0.1.5
flate2-1.0.7
fnv-1.0.6
fuchsia-cprng-0.1.1
heck-0.3.1
humantime-1.2.0
ident_case-1.0.1
itoa-0.4.3
lazy_static-1.3.0
lazycell-1.2.1
libc-0.2.53
line-wrap-0.1.1
linked-hash-map-0.5.2
lock_api-0.1.5
memchr-2.2.0
miniz-sys-0.1.11
miniz_oxide-0.2.1
miniz_oxide_c_api-0.2.1
nodrop-0.1.13
numtoa-0.1.0
onig-4.3.2
onig_sys-69.1.0
owning_ref-0.4.0
parking_lot-0.7.1
parking_lot_core-0.4.0
pkg-config-0.3.14
plist-0.4.1
prettyprint-0.6.0
proc-macro2-0.4.28
quick-error-1.2.2
quote-0.6.12
rand-0.6.5
rand_chacha-0.1.1
rand_core-0.3.1
rand_core-0.4.0
rand_hc-0.1.0
rand_isaac-0.1.1
rand_jitter-0.1.3
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.54
redox_termios-0.1.1
redox_users-0.3.0
regex-1.1.6
regex-syntax-0.6.6
remove_dir_all-0.5.1
rustc-demangle-0.1.14
rustc_version-0.2.3
ryu-0.2.7
safemem-0.3.0
same-file-1.0.4
scoped_threadpool-0.1.9
scopeguard-0.3.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.90
serde_derive-1.0.90
serde_json-1.0.39
shell-words-0.1.0
smallvec-0.6.9
stable_deref_trait-1.1.1
strsim-0.8.0
structopt-0.2.15
structopt-derive-0.2.15
syn-0.15.33
syn-select-0.1.4
synstructure-0.10.1
syntect-3.2.0
tempfile-3.0.7
termcolor-1.0.4
termion-1.5.2
termios-0.3.1
textwrap-0.11.0
thread_local-0.3.6
toml-0.5.0
toolchain_find-0.1.4
ucd-util-0.1.3
unicode-segmentation-1.2.1
unicode-width-0.1.5
unicode-xid-0.1.0
utf8-ranges-1.0.2
vec_map-0.8.1
walkdir-2.2.7
winapi-0.3.7
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.1
xml-rs-0.8.0
yaml-rust-0.4.3
"

inherit cargo

DESCRIPTION="Wrapper around rustc --pretty=expanded. Shows the result of macro expansion and #[derive] expansion."
HOMEPAGE="https://github.com/dtolnay/cargo-expand"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT/Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""