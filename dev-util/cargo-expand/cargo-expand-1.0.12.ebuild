# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.2-alpha.0

EAPI=8

CRATES="
	adler-1.0.2
	aho-corasick-0.7.18
	ansi_colours-1.0.4
	ansi_term-0.12.1
	atty-0.2.14
	autocfg-1.0.1
	base64-0.13.0
	bat-0.18.3
	bincode-1.3.3
	bit-set-0.5.2
	bit-vec-0.6.3
	bitflags-1.3.2
	bstr-0.2.17
	bugreport-0.4.1
	cc-1.0.72
	cfg-if-1.0.0
	clap-3.0.0
	clap_derive-3.0.0
	clircle-0.3.0
	console-0.14.1
	content_inspector-0.2.4
	crc32fast-1.3.0
	encode_unicode-0.3.6
	cargo-expand-1.0.12
	encoding-0.2.33
	encoding-index-japanese-1.20141219.5
	encoding-index-korean-1.20141219.5
	encoding-index-simpchinese-1.20141219.5
	encoding-index-singlebyte-1.20141219.5
	encoding-index-tradchinese-1.20141219.5
	encoding_index_tests-0.1.4
	error-chain-0.12.4
	fancy-regex-0.7.1
	flate2-1.0.22
	fnv-1.0.7
	getrandom-0.2.3
	git-version-0.3.5
	git-version-macro-0.3.5
	globset-0.4.8
	grep-cli-0.1.6
	hashbrown-0.11.2
	heck-0.3.3
	hermit-abi-0.1.19
	home-0.5.3
	indexmap-1.7.0
	itoa-0.4.8
	itoa-1.0.1
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.112
	line-wrap-0.1.1
	linked-hash-map-0.5.4
	log-0.4.14
	memchr-2.4.1
	miniz_oxide-0.4.4
	os_str_bytes-6.0.0
	path_abs-0.5.1
	pest-2.1.3
	plist-1.3.1
	ppv-lite86-0.2.16
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.36
	quote-1.0.14
	rand-0.8.4
	rand_chacha-0.3.1
	rand_core-0.6.3
	rand_hc-0.3.1
	redox_syscall-0.2.10
	regex-1.5.4
	regex-automata-0.1.10
	regex-syntax-0.6.25
	remove_dir_all-0.5.3
	ryu-1.0.9
	safemem-0.3.3
	same-file-1.0.6
	semver-0.11.0
	semver-parser-0.10.2
	serde-1.0.133
	serde_derive-1.0.133
	serde_json-1.0.74
	serde_yaml-0.8.23
	shell-escape-0.1.5
	shell-words-1.0.0
	std_prelude-0.2.12
	strsim-0.10.0
	syn-1.0.84
	syn-select-0.2.0
	syntect-4.6.0
	sys-info-0.9.1
	tempfile-3.2.0
	termcolor-1.1.2
	terminal_size-0.1.17
	textwrap-0.14.2
	time-0.3.5
	toml-0.5.8
	toolchain_find-0.2.0
	ucd-trie-0.1.3
	unicode-segmentation-1.8.0
	unicode-width-0.1.9
	unicode-xid-0.2.2
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.10.2+wasi-snapshot-preview1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	xml-rs-0.8.4
	yaml-rust-0.4.5
"

inherit cargo

DESCRIPTION="Wrapper around rustc -Zunpretty=expanded. Shows the result of macro expansion and #[derive] expansion."
# Double check the homepage as the cargo_metadata crate
# does not provide this value so instead repository is used
HOMEPAGE="https://github.com/dtolnay/cargo-expand"
SRC_URI="$(cargo_crate_uris ${CRATES})"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0 WITH LLVM-exception BSD-2-Clause BSL-1.0 CC0-1.0 LGPL-3.0-or-later MIT Unlicense Zlib"
SLOT="0"
KEYWORDS="amd64"
RESTRICT="mirror"
