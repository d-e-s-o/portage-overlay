# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="
aho-corasick-0.6.3
bitflags-0.9.1
diff-0.1.10
dtoa-0.4.1
env_logger-0.4.3
extprim-1.2.2
getopts-0.2.14
itoa-0.3.1
kernel32-sys-0.2.2
libc-0.2.23
log-0.3.8
memchr-1.0.1
num-traits-0.1.39
quote-0.3.15
rand-0.3.15
regex-0.2.2
regex-syntax-0.4.1
rustc_version-0.2.1
rustfmt-0.9.0
semver-0.6.0
semver-parser-0.7.0
serde-1.0.8
serde_derive-1.0.8
serde_derive_internals-0.15.1
serde_json-1.0.2
strings-0.1.0
syn-0.11.11
synom-0.11.3
syntex_errors-0.59.0
syntex_pos-0.59.0
syntex_syntax-0.59.0
term-0.4.5
thread-id-3.1.0
thread_local-0.3.3
toml-0.4.1
unicode-segmentation-1.2.0
unicode-xid-0.0.4
unicode-xid-0.1.0
unreachable-0.1.1
utf8-ranges-1.0.0
void-1.0.2
winapi-0.2.8
winapi-build-0.1.1
"

inherit cargo

DESCRIPTION="Tool to find and fix Rust formatting issues"
HOMEPAGE="https://github.com/rust-lang-nursery/rustfmt"
SRC_URI="$(cargo_crate_uris ${CRATES})"
LICENSE="|| ( MIT Apache-2.0 )"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=">=dev-lang/rust-1.19.0"
RDEPEND=""
