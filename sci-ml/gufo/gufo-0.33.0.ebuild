EAPI=8

CARGO_OPTIONAL=1
# The Rust workspace pins rust-version = 1.88.
RUST_MIN_VER="1.88.0"

ROCM_VERSION=10.1.0
LLVM_COMPAT=( 23 )

# Registry crates for the Rust components (root Cargo.lock at v0.33.0).
# Regenerate against Cargo.lock on every bump.
CRATES="
	adler2@2.0.1
	bitflags@2.13.2
	cfg-if@1.0.5
	crc32fast@1.5.3
	fdeflate@0.3.7
	flate2@1.1.10
	miniz_oxide@0.8.9
	miniz_oxide@0.9.1
	png@0.18.1
	simd-adler32@0.3.10
	zlib-rs@0.6.8
"

inherit cargo cmake flag-o-matic git-r3 llvm-r2 rocm

DESCRIPTION="Local inference engine optimized for AMD Strix Halo (gfx1151)"
HOMEPAGE="https://github.com/gufo-org/gufo"

SRC_URI="${CARGO_CRATE_URIS}"

EGIT_REPO_URI="https://github.com/gufo-org/gufo.git"
EGIT_COMMIT="v${PV}"

S="${WORKDIR}/${P}"

LICENSE="MIT BSD Apache-2.0
	|| ( Apache-2.0 MIT )
	|| ( 0BSD Apache-2.0 MIT )
	|| ( Apache-2.0 MIT Zlib )
	Zlib
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="embedding_gemma2 qwen_image_21"

REQUIRED_USE="amdgpu_targets_gfx1151"

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
	embedding_gemma2? ( media-libs/libsndfile media-libs/soxr )
	media-video/ffmpeg
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-build/cmake
	app-alternatives/ninja
	virtual/pkgconfig
	dev-util/hipcc:0/10.1
	${RUST_DEPEND}
"

PATCHES=(
	"${FILESDIR}"/${PN}-fix-type-mismatches.patch
)

src_unpack() {
	git-r3_src_unpack

	cargo_crate_unpack
	cargo_gen_config
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

	append-cflags -DNDEBUG
	append-cxxflags -DNDEBUG

	export ROCM_PATH="${EPREFIX}/usr"
	export HIP_PATH="${EPREFIX}/usr"

	# We support all models except for 'deepseek_v4_flash': it requires
	# rocWMMA headers, which mismatch *hard*. Seems to be similar to
	# https://github.com/ggml-org/llama.cpp/issues/30839
	local -a gufo_ext=(
		minimax_h3
		qwen
		qwen3_asr
		qwen3_tts
		qwen38_flash_next
	)

	use embedding_gemma2 && gufo_ext+=( embedding_gemma2 )
	use qwen_image_21 && gufo_ext+=( qwen_image_21 )

	local IFS=\;
	local gufo_extensions="${gufo_ext[*]}"

	local mycmakeargs=(
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_SKIP_RPATH=ON

		-DCMAKE_HIP_COMPILER="${hipclang}"
		-DCMAKE_HIP_COMPILER_ROCM_ROOT="${EPREFIX}/usr"
		-DCMAKE_HIP_ARCHITECTURES=gfx1151

		-DENGINE_ENABLE_HIP=ON
		-DBUILD_TESTING=OFF
		-DGUFO_BUILD_TOOLS=OFF

		-DGUFO_EXTENSIONS="${gufo_extensions}"
		-DGUFO_RELEASE_VERSION="${PV}"
		-DGUFO_REVISION="${revision}"

		-DGUFO_FFMPEG_EXECUTABLE="${EPREFIX}/usr/bin/ffmpeg"
		-DGUFO_FFPROBE_EXECUTABLE="${EPREFIX}/usr/bin/ffprobe"

		# Only the deepseek_v4_flash required rocwmma headers (and we
		# explicitly remove it). However, gufo core still checks for
		# header existence. By setting a cached value here we
		# effectively sidestep any probing for non-existent headers.
		-DROCWMMA_INCLUDE_DIR="${WORKDIR}/rocwmma-headers-not-required"
	)

	cmake_src_configure
}

src_test() {
	[[ -c /dev/kfd ]] && check_amdgpu
	"${BUILD_DIR}/gufo" --version || die
	"${BUILD_DIR}/gufo" --help >/dev/null || die
}
