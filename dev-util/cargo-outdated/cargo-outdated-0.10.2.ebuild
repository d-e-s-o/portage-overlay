# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2-alpha.0

EAPI=7

CRATES="
adler-1.0.2
aho-corasick-0.7.18
ansi_term-0.11.0
anyhow-1.0.44
arrayvec-0.5.2
atty-0.2.14
autocfg-1.0.1
bitflags-1.3.2
bitmaps-2.1.0
bstr-0.2.17
bytesize-1.1.0
cargo-0.57.0
cargo-outdated-0.10.2
cargo-platform-0.1.2
cargo-util-0.1.1
cc-1.0.71
cfg-if-1.0.0
clap-2.33.3
commoncrypto-0.2.0
commoncrypto-sys-0.2.0
core-foundation-0.9.2
core-foundation-sys-0.8.3
crates-io-0.33.0
crc32fast-1.2.1
crossbeam-utils-0.8.5
crypto-hash-0.3.4
curl-0.4.39
curl-sys-0.4.49+curl-7.79.1
docopt-1.1.1
either-1.6.1
env_logger-0.9.0
filetime-0.2.15
flate2-1.0.22
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.0.1
fwdansi-1.1.0
getrandom-0.2.3
git2-0.13.23
git2-curl-0.14.1
glob-0.3.0
globset-0.4.8
hermit-abi-0.1.19
hex-0.3.2
hex-0.4.3
home-0.5.3
humantime-2.1.0
idna-0.2.3
ignore-0.4.18
im-rc-15.0.0
itertools-0.10.1
itoa-0.4.8
jobserver-0.1.24
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.104
libgit2-sys-0.12.24+1.3.0
libnghttp2-sys-0.1.7+1.45.0
libssh2-sys-0.2.23
libz-sys-1.1.3
log-0.4.14
matches-0.1.9
memchr-2.4.1
miniz_oxide-0.4.4
miow-0.3.7
num_cpus-1.13.0
once_cell-1.8.0
opener-0.5.0
openssl-0.10.36
openssl-probe-0.1.4
openssl-src-111.16.0+1.1.1l
openssl-sys-0.9.67
percent-encoding-2.1.0
pkg-config-0.3.20
ppv-lite86-0.2.14
proc-macro2-1.0.30
quote-1.0.10
rand-0.8.4
rand_chacha-0.3.1
rand_core-0.5.1
rand_core-0.6.3
rand_hc-0.3.1
rand_xoshiro-0.4.0
redox_syscall-0.2.10
regex-1.5.4
regex-automata-0.1.10
regex-syntax-0.6.25
remove_dir_all-0.5.3
rustc-workspace-hack-1.0.0
rustfix-0.6.0
ryu-1.0.5
same-file-1.0.6
schannel-0.1.19
semver-1.0.4
serde-1.0.130
serde_derive-1.0.130
serde_ignored-0.1.2
serde_json-1.0.68
shell-escape-0.1.5
sized-chunks-0.6.5
socket2-0.4.2
strip-ansi-escapes-0.1.1
strsim-0.8.0
strsim-0.10.0
syn-1.0.80
tabwriter-1.2.1
tar-0.4.37
tempfile-3.2.0
termcolor-1.1.2
textwrap-0.11.0
thread_local-1.1.3
tinyvec-1.5.0
tinyvec_macros-0.1.0
toml-0.5.8
typenum-1.14.0
unicode-bidi-0.3.7
unicode-normalization-0.1.19
unicode-width-0.1.9
unicode-xid-0.2.2
url-2.2.2
utf8parse-0.2.0
vcpkg-0.2.15
vec_map-0.8.2
version_check-0.9.3
vte-0.10.1
vte_generate_state_changes-0.1.1
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Cargo subcommand for displaying when dependencies are out of date"
HOMEPAGE="https://github.com/kbknapp/cargo-outdated.git"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSL-1.0 MIT MPL-2.0+ Unlicense Zlib"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
