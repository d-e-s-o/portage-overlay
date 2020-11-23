# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.0

EAPI=7

CRATES="
ansi_term-0.11.0
atty-0.2.14
bitflags-1.2.1
cargo-llvm-lines-0.4.9
clap-2.33.3
fuchsia-cprng-0.1.1
heck-0.3.1
hermit-abi-0.1.17
lazy_static-1.4.0
libc-0.2.79
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro2-1.0.24
quote-1.0.7
rand-0.4.6
rand_core-0.3.1
rand_core-0.4.2
rdrand-0.4.0
remove_dir_all-0.5.3
rustc-demangle-0.1.17
strsim-0.8.0
structopt-0.3.20
structopt-derive-0.4.13
syn-1.0.45
tempdir-0.3.7
term_size-0.3.2
textwrap-0.11.0
unicode-segmentation-1.6.0
unicode-width-0.1.8
unicode-xid-0.2.1
vec_map-0.8.2
version_check-0.9.2
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
"

inherit cargo

DESCRIPTION="Count the number of lines of LLVM IR across all instantiations of a generic function."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/dtolnay/cargo-llvm-lines"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="Apache-2.0 ISC MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
