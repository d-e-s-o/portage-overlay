# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="AMD FlexML client runtime for Ryzen AI NPU inference (VitisAI engine)"
HOMEPAGE="https://ryzenai.docs.amd.com/en/latest/"

# Upstream ships flexmlrt only as a Python wheel. This release repacks
# that exact wheel and is what whisper.cpp upstream documents and
# CI-tests against (see https://github.com/ggml-org/whisper.cpp/pull/3608):
SRC_URI="https://github.com/lemonade-sdk/whisper.cpp-rocm/releases/download/deps/${P}-linux.tar.gz"
S="${WORKDIR}"

LICENSE="AMD-EULA"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist strip mirror"

# Prebuilt, not stripped by us.
QA_PREBUILT="opt/flexmlrt/lib/*"

RDEPEND="
	dev-lang/python:=
	dev-util/xrt
"

BDEPEND="
	dev-util/patchelf
"

src_install() {
	local dest="${EPREFIX}/opt/${PN}"

	exeinto "${dest}/lib"
	doexe "${PN}"/lib/libflexmlrt.so
	# operator plugin dlopened by libflexmlrt.so at runtime
	doexe "${PN}"/lib/libscale_op_plugin.so

	# AMD built the RUNPATH with absolute build-machine directories and, in
	# libflexmlrt.so, a trailing empty element that glibc interprets as
	# "also search $PWD" -- which Portage's scanelf pass flags as
	# "Security problem NULL DT_RUNPATH".  Normalize both objects to
	# $ORIGIN.
	local elf
	for elf in libflexmlrt.so libscale_op_plugin.so; do
		patchelf --set-rpath '$ORIGIN' "${ED}${dest}/lib/${elf}" || die
	done

	# libflexmlrt.so wants DT_NEEDED libpython3.12.so.1.0, but its
	# CPython coupling is 22 stable public C-API symbols (PyList_*,
	# PyLong_*, PyGILState_*, Py_Initialize, ...), all of which
	# 3.13/3.14 still export. Rather than require an extra
	# dev-lang/python slot, generate a minimal stub whose DT_SONAME is
	# libpython3.12.so.1.0 and whose DT_NEEDED pulls in the real shared
	# libpython.
	local have312=""
	local cand v
	for cand in "${ROOT}${EPREFIX}"/usr/lib*/libpython3.12.so.1.0; do
		if [ -f "${cand}" ]; then
			have312=1
			break
		fi
	done
	if [ -z "${have312}" ]; then
		local pyso=""
		for v in 14 13; do
			for cand in "${ROOT}${EPREFIX}"/usr/lib*/libpython3."${v}".so.1.0; do
				if [ -f "${cand}" ]; then
					pyso="${cand}"
					break 2
				fi
			done
		done
		[ -n "${pyso}" ] || \
			die "no shared libpython3.1[2-4].so found; rebuild dev-lang/python with USE=shared"
		: > "${T}/libpython-compat-stub.c" || die
		${CC:-cc} -shared -nostdlib \
			-Wl,-soname,libpython3.12.so.1.0 -Wl,-z,noexecstack \
			-Wl,--no-as-needed "${pyso}" "${T}/libpython-compat-stub.c" \
			-o "${ED}${dest}/lib/libpython3.12.so.1.0" || die
	fi

	insinto "${dest}/include"
	doins "${PN}"/include/FlexMLClient.h

	insinto "${dest}/share/cmake/FlexmlRT"
	doins "${PN}"/share/cmake/FlexmlRT/FlexmlRTConfig.cmake
	doins "${PN}"/share/cmake/FlexmlRT/FlexmlRTConfigVersion.cmake

	insinto "${dest}"
	doins "${PN}"/__init__.py

	# The shipped config links the bare name "flexmlrt", but nothing adds
	# -L${dest}/lib; rewrite to the full (still relocatable) path.
	sed -i \
		-e 's|^set(flexml_rt_LIBRARIES flexmlrt)$|set(flexml_rt_LIBRARIES "${PACKAGE_PREFIX_DIR}/lib/libflexmlrt.so")|' \
		-e 's|^set(FLEXML_RT_LIBRARIES flexmlrt)$|set(FLEXML_RT_LIBRARIES "${PACKAGE_PREFIX_DIR}/lib/libflexmlrt.so")|' \
		"${D}${dest}/share/cmake/FlexmlRT/FlexmlRTConfig.cmake" || die

	dodoc "${P}.dist-info/licenses/LICENSE.txt"

	# Make sure find_package(FlexmlRT) works without AMD's setup.sh env
	# dance.
	echo "CMAKE_PREFIX_PATH=\"${dest}\"" > "${T}/99${PN}" || die
	insinto /etc/env.d
	doins "${T}/99${PN}"

	# Make sure the loader finds libflexmlrt.so without an
	# LD_LIBRARY_PATH definition.
	dodir /etc/ld.so.conf.d
	echo "${dest}/lib" > "${ED}/etc/ld.so.conf.d/${PN}.conf" || die
}
