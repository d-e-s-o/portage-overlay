# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..14} )
inherit cmake python-any-r1 linux-info

DESCRIPTION="Runtime for AIE and FPGA based platforms"
HOMEPAGE="https://github.com/amd/xdna-driver"

if [[ ${PV} == 999999 ]] ; then
	EGIT_REPO_URI="https://github.com/amd/xdna-driver.git"
	EGIT_SUBMODULES=(
		xrt
		xrt/src/runtime_src/aie-codegen
		xrt/src/runtime_src/aie-codegen/aie-regdb
		xrt/src/runtime_src/core/common/aiebu
		xrt/src/runtime_src/core/common/elf
		xrt/src/runtime_src/xdp
	)
	inherit git-r3

	BDEPEND="net-misc/wget"

	MGS_COMMIT=master
	MGS=markdown_graphviz_svg
	MGS_PY=${MGS}-${MGS_COMMIT}.py
else
	# AMD ships this release only as xrt_plugin.2.25.260102.56 deb
	# (https://ryzenai.docs.amd.com/en/1.8/linux.html). Its
	# /opt/xilinx/xrt/share/amdxdna/version.json pins the sources to:
	#   xdna-driver 88dda53e ("shim: support npu9/npu11 in archive_path query")
	#   xrt         0026185d (info.json "xrt.version": 202620.2.25.37)
	XDNA_COMMIT=88dda53eee336c998abca38c71d5bc79fb3633b8
	XRT_COMMIT=0026185de81a179dc7d886197d3e35f9a179b4e8

	VTD_HASH=406bbbc0f72920567d417f3cf5e25284c12d9176

	MGS_COMMIT=554d75e924ed621f23d077b0495c247c329bc770
	MGS=markdown_graphviz_svg
	MGS_PY=${MGS}-${MGS_COMMIT:0:8}.py

	declare -Ag submodules
	submodules["xrt"]=https://github.com/Xilinx/XRT.git@${XRT_COMMIT}
	submodules["xrt/src/runtime_src/aie-codegen"]=https://github.com/Xilinx/aie-codegen.git@95342426953e6bb3b4e5ae8cb1aa5018cf78ae51
	submodules["xrt/src/runtime_src/aie-codegen/aie-regdb"]=https://github.com/Xilinx/aie-regdb.git@3faba137f02db4dd3f64331e3a74a9b5584df8b7
	submodules["xrt/src/runtime_src/core/common/aiebu"]=https://github.com/Xilinx/aiebu.git@347cc613a4239959cf7146d6f901f9ee9dd418d4
	submodules["xrt/src/runtime_src/core/common/elf"]=https://github.com/serge1/ELFIO.git@f849001fc229c2598f8557e0df22866af194ef98
	submodules["xrt/src/runtime_src/xdp"]=https://github.com/Xilinx/XDP.git@babb4920161babb210fb4ad29fdb5753b64f0d24

	SRC_URI="
		https://github.com/amd/xdna-driver/archive/${XDNA_COMMIT}.tar.gz -> ${P}.tar.gz
		https://github.com/Xilinx/VTD/raw/${VTD_HASH}/archive/strx/xrt_smi_strx.a -> xrt_smi_strx-${VTD_HASH:0:8}.a
		https://github.com/Xilinx/VTD/raw/${VTD_HASH}/archive/phx/xrt_smi_phx.a -> xrt_smi_phx-${VTD_HASH:0:8}.a
		https://github.com/Xilinx/VTD/raw/${VTD_HASH}/archive/npu3/xrt_smi_npu3.a -> xrt_smi_npu3-${VTD_HASH:0:8}.a
		https://raw.githubusercontent.com/Tanami/markdown-graphviz-svg/${MGS_COMMIT}/src/${MGS}/${MGS}.py -> ${MGS_PY}
	"
	for k in "${!submodules[@]}"; do
		git_url="${submodules[$k]%@*}"
		commit_hash="${submodules[$k]#*@}"
		url_prefix="${git_url%.git}"
		SRC_URI+=" ${url_prefix}/archive/${commit_hash}.tar.gz -> ${url_prefix##*/}-${commit_hash:0:8}.tar.gz";
	done

	KEYWORDS="~amd64"
	S="${WORKDIR}/xdna-driver-${XDNA_COMMIT}"
fi

LICENSE="AMD-Binary-Only"
SLOT="0"

RESTRICT="bindist mirror strip"

RDEPEND="
	>=dev-util/xrt-2.25.0
	<dev-util/xrt-2.26.0
	sys-apps/util-linux
"

# Mostly thowaway dependencies, not actually used in final lib...
DEPEND="
	sys-apps/util-linux
	dev-debug/systemtap
	dev-libs/boost
	dev-libs/opencl-icd-loader
	dev-libs/rapidjson
	dev-util/opencl-headers
	x11-libs/libdrm
"

BDEPEND+="
	${PYTHON_DEPS}
	$(python_gen_any_dep "
		dev-python/pybind11[\${PYTHON_USEDEP}]
	")
"

CONFIG_CHECK="~AMD_IOMMU ~DRM_ACCEL"

python_check_deps() {
	python_has_version -b "dev-python/pybind11[${PYTHON_USEDEP}]"
}

src_unpack() {
	if [[ ${PV} == 999999 ]] ; then
		git-r3_src_unpack

		pushd "${S}" || die
		# This downloads files specified in https://github.com/amd/xdna-driver/blob/main/tools/WHENCE
		# VTD files signatures are not present in the Manifest, but effectively pinned via "whence-commit"
		"${EPYTHON}" tools/sync_from_whence.py vtd --out amdxdna_bins/vtd_archives --whence tools/WHENCE || die

		local msgs_url="https://raw.githubusercontent.com/Tanami/markdown-graphviz-svg/${MGS_COMMIT}/src/${MGS}/${MGS}.py"
		if ! wget -nc "${msgs_url}" -O "${MGS_PY}"; then
			die "Fetching from ${msgs_url} failed"
		fi

		popd || die
	else
		default

		pushd "${S}" || die
		for k in $(printf '%s\n' "${!submodules[@]}" | sort); do
			git_url="${submodules[$k]%@*}"
			commit_hash="${submodules[$k]#*@}"
			url_prefix="${git_url%.git}"
			rm -r "$k" || die
			ln -s "${WORKDIR}/${url_prefix##*/}-${commit_hash}" "$k" || die
		done

		# Sanity check for new versions
		local actual_vtd_hash=$(grep -oP 'VTD/raw/\K[0-9a-f]+' tools/info.json | head -n1)
		[[ "${actual_vtd_hash}" == "" ]] && die "Failed to extract VTD hash"
		[[ "${actual_vtd_hash}" != "${VTD_HASH}" ]] && \
			die "VTD hash mismatch, ebuild requested ${VTD_HASH} while package wants ${actual_vtd_hash}"

		mkdir -p amdxdna_bins/vtd_archives || die
		cp "${DISTDIR}/xrt_smi_strx-${VTD_HASH:0:8}.a" amdxdna_bins/vtd_archives/xrt_smi_strx.a || die
		cp "${DISTDIR}/xrt_smi_phx-${VTD_HASH:0:8}.a" amdxdna_bins/vtd_archives/xrt_smi_phx.a || die
		cp "${DISTDIR}/xrt_smi_npu3-${VTD_HASH:0:8}.a" amdxdna_bins/vtd_archives/xrt_smi_npu3.a || die
		popd || die
	fi
}

src_prepare() {
	pushd "xrt/src/runtime_src/core/common/aiebu" || die
	eapply "${FILESDIR}"/aiebu-no-downloads.patch
	popd || die

	sed -e "/Unknown Linux package flavor/ s/FATAL_ERROR/MESSAGE/" -i "CMake/pkg.cmake" || die

	sed -e "s/set (XRT_UPSTREAM 0)/set (XRT_UPSTREAM 1)/" -i xrt/src/CMake/settings.cmake || die

	sed -e 's/"-Werror"//' -i src/shim/CMakeLists.txt || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}"/usr
		-DSKIP_KMOD=1
		-DUMQ_HELLO_TEST=n
		-DPython3_EXECUTABLE="${PYTHON}"
		-DSPEC_TOOL_DEPS_DOWNLOADED=ON
		-Wno-dev
	)
	[[ ${PV} != 999999 ]] && mycmakeargs+=( -DCMAKE_DISABLE_FIND_PACKAGE_Git=ON )

	cmake_src_configure

	if [[ ${PV} == 999999 ]]; then
		local mgs_py_path="${S}/${MGS_PY}"
	else
		local mgs_py_path="${DISTDIR}/${MGS_PY}"
	fi

	ln -s "${mgs_py_path}" "${BUILD_DIR}/xrt/src/runtime_src/core/common/aiebu/specification/${MGS}.py" || die
}

src_install() {
	cmake_src_install

	insinto /usr/share/xrt/amdxdna/bins
	doins amdxdna_bins/vtd_archives/*

	# belongs to dev-util/xrt
	rm -rf "${ED}/bins" || die
}
