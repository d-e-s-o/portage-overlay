EAPI=8

CARGO_OPTIONAL=1
# The Rust workspace pins rust-version = 1.88.
RUST_MIN_VER="1.88.0"

ROCM_VERSION=10.2.0
LLVM_COMPAT=( 23 )

# Registry crates for the Rust components (root Cargo.lock at v0.36.0).
# Regenerate against Cargo.lock on every bump.
CRATES="
	adler2@2.0.1
	autocfg@1.5.1
	bitflags@2.13.2
	bytemuck@1.25.2
	cfg-if@1.0.5
	crc32fast@1.5.3
	extended@0.1.0
	fdeflate@0.3.7
	flate2@1.1.10
	httparse@1.10.1
	lazy_static@1.5.1
	log@0.4.35
	miniz_oxide@0.8.9
	miniz_oxide@0.9.1
	num-complex@0.4.6
	num-traits@0.2.19
	png@0.18.1
	regex-lite@0.1.9
	simd-adler32@0.3.10
	smallvec@1.16.5
	symphonia@0.6.1
	symphonia-bundle-flac@0.6.1
	symphonia-bundle-mp3@0.6.1
	symphonia-codec-adpcm@0.6.1
	symphonia-codec-pcm@0.6.1
	symphonia-codec-vorbis@0.6.1
	symphonia-common@0.6.1
	symphonia-core@0.6.1
	symphonia-format-ogg@0.6.1
	symphonia-format-riff@0.6.1
	symphonia-metadata@0.6.1
	zlib-rs@0.6.8
	zune-core@0.5.3
	zune-jpeg@0.5.15
"

inherit cargo cmake flag-o-matic llvm-r2 rocm

DESCRIPTION="Local inference engine optimized for AMD Strix Halo (gfx1151)"
HOMEPAGE="https://github.com/gufo-org/gufo"

SRC_URI="
	https://github.com/gufo-org/gufo/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT BSD Apache-2.0 MPL-2.0
	|| ( Apache-2.0 MIT )
	|| ( 0BSD Apache-2.0 MIT )
	|| ( Apache-2.0 MIT ZLIB )
	ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="deepseek-v4-flash"

REQUIRED_USE="amdgpu_targets_gfx1151"

DEPEND="
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
	')

	dev-util/hip:0/10.2[hip,video_cards_amdgpu]

	sci-libs/hipBLAS:0/10.2[${ROCM_USEDEP}]
	sci-libs/hipBLASLt:0/10.2[${ROCM_USEDEP}]
	sci-libs/hipCUB:0/10.2[${ROCM_USEDEP}]
	sci-libs/rocBLAS:0/10.2[${ROCM_USEDEP}]
	sci-libs/rocPRIM:0/10.2[${ROCM_USEDEP}]
	deepseek-v4-flash? ( sci-libs/rocWMMA:0/10.2[${ROCM_USEDEP}] )

	dev-util/xrt

	dev-libs/icu
	net-misc/curl
	dev-libs/openssl
	media-libs/libpng
	media-libs/libjpeg-turbo
	media-libs/libwebp
	media-libs/opus
	media-video/ffmpeg
"

RDEPEND="${DEPEND}"

BDEPEND="
	dev-build/cmake
	app-alternatives/ninja
	virtual/pkgconfig
	dev-util/hipcc:0/10.2
	${RUST_DEPEND}
"

PATCHES=(
	"${FILESDIR}"/${PN}-rocwmma-probe.patch
)

src_unpack() {
	unpack ${P}.tar.gz

	cargo_crate_unpack
	cargo_gen_config
}

src_configure() {
	local llvm_prefix
	llvm_prefix=$(get_llvm_prefix) || die

	local -x CC="${llvm_prefix}/bin/clang"
	local -x CXX="${llvm_prefix}/bin/clang++"

	local hipclangpath
	hipclangpath=$(hipconfig --hipclangpath) || die

	local hipclang="${hipclangpath}/${CHOST}-clang"
	[[ -x ${hipclang} ]] || die "HIP Clang not found: ${hipclang}"

	append-cflags -DNDEBUG
	append-cxxflags -DNDEBUG

	export ROCM_PATH="${EPREFIX}/usr"
	export HIP_PATH="${EPREFIX}/usr"

	local -a gufo_ext=(
		embedding_gemma2
		minimax_h3
		qwen
		qwen3_asr
		qwen3_tts
		qwen38_flash_next
		qwen_image_21
	)

	use deepseek-v4-flash && gufo_ext+=( deepseek_v4_flash )

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
		-DGUFO_REVISION="${PV}"

		-DGUFO_FFMPEG_EXECUTABLE="${EPREFIX}/usr/bin/ffmpeg"
		-DGUFO_FFPROBE_EXECUTABLE="${EPREFIX}/usr/bin/ffprobe"
	)

	cmake_src_configure
}

src_test() {
	[[ -c /dev/kfd ]] && check_amdgpu
	"${BUILD_DIR}/gufo" --version || die
	"${BUILD_DIR}/gufo" --help >/dev/null || die
}
