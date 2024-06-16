# Copyright 2017-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2-alpha.0

EAPI=8

CRATES="
adler-1.0.2
ahash-0.8.3
aho-corasick-0.7.20
aho-corasick-1.0.2
anstream-0.3.2
anstyle-1.0.0
anstyle-parse-0.2.0
anstyle-query-1.0.0
anstyle-wincon-1.0.1
anyhow-1.0.71
arc-swap-1.6.0
arrayvec-0.5.2
autocfg-1.1.0
base16ct-0.2.0
base64-0.21.2
base64ct-1.6.0
bitflags-1.3.2
bitmaps-2.1.0
block-buffer-0.10.4
bstr-1.5.0
btoi-0.4.3
bumpalo-3.13.0
bytes-1.4.0
bytesize-1.2.0
cargo-0.71.0
cargo-outdated-0.13.1
cargo-platform-0.1.2
cargo-util-0.2.4
cc-1.0.79
cfg-if-1.0.0
clap-4.3.4
clap_builder-4.3.4
clap_derive-4.3.2
clap_lex-0.5.0
clru-0.6.1
colorchoice-1.0.0
const-oid-0.9.2
core-foundation-0.9.3
core-foundation-sys-0.8.4
cpufeatures-0.2.8
crates-io-0.36.0
crc32fast-1.3.2
crossbeam-channel-0.5.8
crossbeam-utils-0.8.16
crypto-bigint-0.5.2
crypto-common-0.1.6
ct-codecs-1.1.1
ctor-0.1.26
curl-0.4.44
curl-sys-0.4.63+curl-8.1.2
der-0.7.6
diff-0.1.13
digest-0.10.7
dirs-4.0.0
dirs-sys-0.3.7
dunce-1.0.4
ecdsa-0.16.7
ed25519-compact-2.0.4
either-1.8.1
elliptic-curve-0.13.5
env_logger-0.10.0
errno-0.3.1
errno-dragonfly-0.1.2
fastrand-1.9.0
ff-0.13.0
fiat-crypto-0.1.20
filetime-0.2.21
flate2-1.0.26
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
form_urlencoded-1.2.0
fwdansi-1.1.0
generic-array-0.14.7
getrandom-0.2.10
git2-0.17.2
git2-curl-0.18.0
gix-0.39.0
gix-actor-0.19.0
gix-attributes-0.10.0
gix-bitmap-0.2.4
gix-chunk-0.4.2
gix-command-0.2.5
gix-config-0.18.0
gix-config-value-0.10.2
gix-credentials-0.11.0
gix-date-0.4.3
gix-diff-0.28.1
gix-discover-0.15.0
gix-features-0.28.1
gix-glob-0.5.5
gix-hash-0.10.4
gix-hashtable-0.1.3
gix-index-0.14.0
gix-lock-4.0.0
gix-mailmap-0.11.0
gix-object-0.28.0
gix-odb-0.42.0
gix-pack-0.32.0
gix-packetline-0.14.3
gix-path-0.7.3
gix-prompt-0.3.3
gix-protocol-0.28.0
gix-quote-0.4.4
gix-ref-0.26.0
gix-refspec-0.9.0
gix-revision-0.12.2
gix-sec-0.6.2
gix-tempfile-4.1.0
gix-transport-0.27.0
gix-traverse-0.24.0
gix-url-0.15.0
gix-validate-0.7.5
gix-worktree-0.14.0
glob-0.3.1
globset-0.4.10
group-0.13.0
hashbrown-0.12.3
hashbrown-0.13.2
heck-0.4.1
hermit-abi-0.3.1
hex-0.4.3
hkdf-0.12.3
hmac-0.12.1
home-0.5.5
http-auth-0.1.8
humantime-2.1.0
idna-0.4.0
ignore-0.4.20
im-rc-15.1.0
imara-diff-0.1.5
indexmap-1.9.3
instant-0.1.12
io-close-0.3.7
io-lifetimes-1.0.11
is-terminal-0.4.7
itertools-0.10.5
itoa-1.0.6
jobserver-0.1.26
js-sys-0.3.64
lazy_static-1.4.0
lazycell-1.3.0
libc-0.2.146
libgit2-sys-0.15.2+1.6.4
libnghttp2-sys-0.1.7+1.45.0
libssh2-sys-0.3.0
libz-sys-1.1.9
linux-raw-sys-0.3.8
lock_api-0.4.10
log-0.4.19
maybe-async-0.2.7
memchr-2.5.0
memmap2-0.5.10
minimal-lexical-0.2.1
miniz_oxide-0.7.1
miow-0.5.0
nix-0.26.2
nom-7.1.3
num-traits-0.2.15
num_threads-0.1.6
once_cell-1.18.0
opener-0.5.2
openssl-0.10.54
openssl-macros-0.1.1
openssl-probe-0.1.5
openssl-src-111.26.0+1.1.1u
openssl-sys-0.9.88
ordered-float-2.10.0
orion-0.17.4
os_info-3.7.0
output_vt100-0.1.3
p384-0.13.0
parking_lot-0.12.1
parking_lot_core-0.9.8
pasetors-0.6.7
pathdiff-0.2.1
pem-rfc7468-0.7.0
percent-encoding-2.3.0
pkcs8-0.10.2
pkg-config-0.3.27
ppv-lite86-0.2.17
pretty_assertions-1.3.0
primeorder-0.13.2
proc-macro2-1.0.60
prodash-23.1.2
quote-1.0.28
rand-0.8.5
rand_chacha-0.3.1
rand_core-0.6.4
rand_xoshiro-0.6.0
redox_syscall-0.2.16
redox_syscall-0.3.5
redox_users-0.4.3
regex-1.8.4
regex-automata-0.1.10
regex-syntax-0.7.2
rfc6979-0.4.0
rustc-workspace-hack-1.0.0
rustfix-0.6.1
rustix-0.37.20
rustversion-1.0.12
ryu-1.0.13
same-file-1.0.6
schannel-0.1.21
scopeguard-1.1.0
sec1-0.7.2
semver-1.0.17
serde-1.0.164
serde-value-0.7.0
serde_derive-1.0.164
serde_ignored-0.1.7
serde_json-1.0.97
serde_spanned-0.6.2
sha1-0.10.5
sha1_smol-1.0.0
sha2-0.10.7
shell-escape-0.1.5
signal-hook-0.3.15
signal-hook-registry-1.4.1
signature-2.1.0
sized-chunks-0.6.5
smallvec-1.10.0
socket2-0.4.9
spki-0.7.2
static_assertions-1.1.0
strip-ansi-escapes-0.1.1
strsim-0.10.0
strum-0.25.0
strum_macros-0.25.0
subtle-2.5.0
syn-1.0.109
syn-2.0.18
tabwriter-1.2.1
tar-0.4.38
tempfile-3.6.0
termcolor-1.2.0
thiserror-1.0.40
thiserror-impl-1.0.40
thread_local-1.1.7
time-0.3.22
time-core-0.1.1
time-macros-0.2.9
tinyvec-1.6.0
tinyvec_macros-0.1.1
toml-0.7.4
toml_datetime-0.6.2
toml_edit-0.19.10
typenum-1.16.0
unicode-bidi-0.3.13
unicode-bom-1.1.4
unicode-ident-1.0.9
unicode-normalization-0.1.22
unicode-width-0.1.10
unicode-xid-0.2.4
url-2.4.0
utf8parse-0.2.1
vcpkg-0.2.15
version_check-0.9.4
vte-0.10.1
vte_generate_state_changes-0.1.1
walkdir-2.3.3
wasi-0.11.0+wasi-snapshot-preview1
wasm-bindgen-0.2.87
wasm-bindgen-backend-0.2.87
wasm-bindgen-macro-0.2.87
wasm-bindgen-macro-support-0.2.87
wasm-bindgen-shared-0.2.87
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
windows-0.43.0
windows-sys-0.42.0
windows-sys-0.45.0
windows-sys-0.48.0
windows-targets-0.42.2
windows-targets-0.48.0
windows_aarch64_gnullvm-0.42.2
windows_aarch64_gnullvm-0.48.0
windows_aarch64_msvc-0.42.2
windows_aarch64_msvc-0.48.0
windows_i686_gnu-0.42.2
windows_i686_gnu-0.48.0
windows_i686_msvc-0.42.2
windows_i686_msvc-0.48.0
windows_x86_64_gnu-0.42.2
windows_x86_64_gnu-0.48.0
windows_x86_64_gnullvm-0.42.2
windows_x86_64_gnullvm-0.48.0
windows_x86_64_msvc-0.42.2
windows_x86_64_msvc-0.48.0
winnow-0.4.7
yansi-0.5.1
zeroize-1.6.0
"

inherit cargo

DESCRIPTION="Cargo subcommand for displaying when dependencies are out of date"
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/kbknapp/cargo-outdated.git"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="(MIT 0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception Apache-2.0) BSD-1-Clause BSD-3-Clause BSL-1.0 CC0-1.0 MIT MIT-0 MPL-2.0+ Unicode-DFS-2016 Unlicense Zlib"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
