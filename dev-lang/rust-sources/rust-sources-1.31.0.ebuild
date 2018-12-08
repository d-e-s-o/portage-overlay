#/***************************************************************************
# *   Copyright (C) 2018 Daniel Mueller (deso@posteo.net)                   *
# *                                                                         *
# *   This program is free software: you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation, either version 3 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# *   This program is distributed in the hope that it will be useful,       *
# *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
# *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
# *   GNU General Public License for more details.                          *
# *                                                                         *
# *   You should have received a copy of the GNU General Public License     *
# *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
# ***************************************************************************/

EAPI="6"
ETYPE="sources"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
HOMEPAGE="https://github.com/rust-lang/rust"
IUSE=""

DESCRIPTION="The Rust source code"
SRC_URI="https://github.com/rust-lang/rust/archive/${PV}.tar.gz"

src_unpack() {
	unpack "${A}"
	# For some non-apparent reason we have to create the supposed source
	# directory.
	mkdir "${WORKDIR}/${P}"
}

src_install() {
	SRC_DIR="/usr/src/rust"
	insinto "${SRC_DIR}"

	rm "${WORKDIR}"/rust-${PV}/src/Cargo.* || die
	rm "${WORKDIR}"/rust-${PV}/src/*.txt || die
	rm "${WORKDIR}"/rust-${PV}/src/*.md || die
	rm -r "${WORKDIR}"/rust-${PV}/src/bootstrap/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/build_helper/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/ci/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/dlmalloc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/doc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/etc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/grammar/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/jemalloc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/liballoc_jemalloc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/liballoc_system/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libarena/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libbacktrace/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libcompiler_builtins/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libfmt_macros/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libgraphviz/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/liblibc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libpanic_abort/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libpanic_unwind/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libproc_macro/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libprofiler_builtins/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/librustc* || die
	rm -r "${WORKDIR}"/rust-${PV}/src/librustdoc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libserialize/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libsyntax/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libsyntax_ext/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libsyntax_pos/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libterm/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libtest/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/libunwind/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/llvm-emscripten/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/llvm/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/rtstartup/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/rustc/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/rustllvm/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/stdsimd/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/test/ || die
	rm -r "${WORKDIR}"/rust-${PV}/src/tools/ || die

	chmod -R 644 "${WORKDIR}"/rust-${PV}/src/ || die
	chmod -R +X "${WORKDIR}"/rust-${PV}/src/ || die

	doins -r "${WORKDIR}"/rust-${PV}/src/*

	cat <<-EOF > "${T}"/50${P}
	RUST_SRC_PATH="${SRC_DIR}"
	EOF
	doenvd "${T}"/50${P}
}
