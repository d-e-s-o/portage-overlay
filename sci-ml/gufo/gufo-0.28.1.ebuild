EAPI=8

ROCM_VERSION=10.1.0
LLVM_COMPAT=( 23 )

inherit cmake git-r3 llvm-r2 rocm

DESCRIPTION="Local inference engine optimized for AMD Strix Halo (gfx1151)"
HOMEPAGE="https://github.com/gufo-org/gufo"

EGIT_REPO_URI="https://github.com/gufo-org/gufo.git"
EGIT_COMMIT="v${PV}"

SRC_URI="
	https://github.com/ROCm/rocm-libraries/releases/download/therock-${ROCM_VERSION%.*}/hipcub.tar.gz
		-> hipcub-${ROCM_VERSION}.tar.gz
	https://github.com/ROCm/rocm-libraries/releases/download/therock-${ROCM_VERSION%.*}/rocwmma.tar.gz
		-> rocwmma-${ROCM_VERSION}.tar.gz
"

S="${WORKDIR}/${P}"

LICENSE="MIT BSD Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="amdgpu_targets_gfx1151"

#	sci-libs/rocWMMA:0/10.1[${ROCM_USEDEP}]
#	media-libs/soxr
DEPEND="
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
	')

	dev-util/hip:0/10.1[hip,video_cards_amdgpu]

	sci-libs/hipBLAS:0/10.1[${ROCM_USEDEP}]
	sci-libs/hipBLASLt:0/10.1[${ROCM_USEDEP}]
	sci-libs/hipCUB:0/10.1[${ROCM_USEDEP}]
	sci-libs/rocBLAS:0/10.1[${ROCM_USEDEP}]
	sci-libs/rocPRIM:0/10.1[${ROCM_USEDEP}]

	dev-libs/icu
	net-misc/curl
	dev-libs/openssl
	media-libs/libpng
	virtual/jpeg
	media-libs/libwebp
	media-libs/libsndfile
	media-video/ffmpeg
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-build/cmake
	app-alternatives/ninja
	virtual/pkgconfig
	dev-util/hipcc:0/10.1
"

PATCHES=(
	"${FILESDIR}"/${PN}-remove-soxr-dep.patch
	#"${FILESDIR}"/${PN}-remove-unused-model-support.patch
	"${FILESDIR}"/${PN}-fix-type-mismatches.patch
	# We remove support for Deepseek model, in part because it requires
	# rocWMMA headers, which mismatch *hard*. Seems to be similar to
	# https://github.com/ggml-org/llama.cpp/issues/30839
	"${FILESDIR}"/${PN}-remove-deepseek-v4-flash-model.patch
)

src_unpack() {
	git-r3_src_unpack
	unpack "hipcub-${ROCM_VERSION}.tar.gz"
	unpack "rocwmma-${ROCM_VERSION}.tar.gz"
}

src_configure() {
	local llvm_prefix=$(get_llvm_prefix) || die

	local -x CC="${llvm_prefix}/bin/clang"
	local -x CXX="${llvm_prefix}/bin/clang++"

	local hipclangpath
	hipclangpath=$(hipconfig --hipclangpath) || die

	local hipclang="${hipclangpath}/${CHOST}-clang"
	[[ -x ${hipclang} ]] || die "HIP Clang not found: ${hipclang}"

	local revision
	revision=$(git -C "${S}" rev-parse --short=7 HEAD) || die

	export ROCM_PATH="${EPREFIX}/usr"
	export HIP_PATH="${EPREFIX}/usr"

	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=RelWithDebInfo
		-DCMAKE_SKIP_RPATH=ON

		-DCMAKE_HIP_COMPILER="${hipclang}"
		-DCMAKE_HIP_COMPILER_ROCM_ROOT="${EPREFIX}/usr"
		-DCMAKE_HIP_ARCHITECTURES=gfx1151

		-DENGINE_ENABLE_HIP=ON
		-DBUILD_TESTING=OFF
		-DGUFO_BUILD_TOOLS=OFF

		-DGUFO_RELEASE_VERSION="${PV}"
		-DGUFO_REVISION="${revision}"

		-DGUFO_FFMPEG_EXECUTABLE="${EPREFIX}/usr/bin/ffmpeg"
		-DGUFO_FFPROBE_EXECUTABLE="${EPREFIX}/usr/bin/ffprobe"

		-DHIPCUB_INCLUDE_DIR="${WORKDIR}/hipcub/library/include"
		-DROCWMMA_INCLUDE_DIR="${WORKDIR}/rocwmma/library/include"
	)

	cmake_src_configure
}

src_test() {
	"${BUILD_DIR}/gufo" --version || die
	"${BUILD_DIR}/gufo" --help >/dev/null || die
}
