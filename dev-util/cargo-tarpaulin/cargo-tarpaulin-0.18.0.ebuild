# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2-alpha.0

EAPI=7

CRATES="
adler-0.2.3
adler32-1.2.0
aho-corasick-0.7.15
ansi_term-0.11.0
ansi_term-0.12.1
atty-0.2.14
autocfg-1.0.1
bitflags-1.2.1
byteorder-1.4.2
camino-1.0.2
cargo-platform-0.1.1
cargo-tarpaulin-0.18.0
cargo_metadata-0.13.1
cc-1.0.66
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.19
clap-2.33.3
coveralls-api-0.5.0
crc32fast-1.2.1
curl-0.4.34
curl-sys-0.4.39+curl-7.74.0
deflate-0.8.6
fallible-iterator-0.2.0
flate2-1.0.19
form_urlencoded-1.0.0
gimli-0.24.0
git2-0.13.20
gzip-header-0.3.0
hashbrown-0.9.1
hermit-abi-0.1.18
hex-0.4.2
humantime-2.1.0
humantime-serde-1.0.1
idna-0.2.0
indexmap-1.6.2
itoa-0.4.7
jobserver-0.1.21
lazy_static-1.4.0
libc-0.2.96
libgit2-sys-0.12.21+1.1.0
libssh2-sys-0.2.20
libz-sys-1.1.2
log-0.4.13
matchers-0.0.1
matches-0.1.8
md5-0.7.0
memchr-2.3.4
memmap-0.7.0
memoffset-0.6.4
miniz_oxide-0.4.3
nix-0.21.0
num-integer-0.1.44
num-traits-0.2.14
object-0.24.0
openssl-probe-0.1.2
openssl-src-111.13.0+1.1.1i
openssl-sys-0.9.60
percent-encoding-2.1.0
pest-2.1.3
pin-project-lite-0.2.4
pkg-config-0.3.19
proc-macro2-1.0.27
procfs-0.9.1
quick-xml-0.22.0
quote-1.0.9
regex-1.4.6
regex-automata-0.1.9
regex-syntax-0.6.22
rustc-demangle-0.1.20
rustc_version-0.4.0
ryu-1.0.5
same-file-1.0.6
schannel-0.1.19
semver-0.11.0
semver-1.0.3
semver-parser-0.10.2
serde-1.0.126
serde_derive-1.0.126
serde_json-1.0.64
sharded-slab-0.1.1
smallvec-1.6.1
socket2-0.3.19
stable_deref_trait-1.2.0
strsim-0.8.0
syn-1.0.73
textwrap-0.11.0
thread_local-1.1.0
time-0.1.44
tinyvec-1.1.0
tinyvec_macros-0.1.0
toml-0.5.8
tracing-0.1.26
tracing-core-0.1.18
tracing-log-0.1.2
tracing-subscriber-0.2.19
ucd-trie-0.1.3
unicode-bidi-0.3.4
unicode-normalization-0.1.16
unicode-width-0.1.8
unicode-xid-0.2.1
url-2.2.0
vcpkg-0.2.11
vec_map-0.8.2
walkdir-2.3.2
wasi-0.10.0+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Cargo-Tarpaulin is a tool to determine code coverage achieved via tests"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/xd009642/tarpaulin"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSL-1.0 MIT Unlicense Zlib"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
