# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Multi-channel signed distance field generator"
HOMEPAGE="https://github.com/Chlumsky/msdfgen"
SRC_URI="https://github.com/Chlumsky/msdfgen/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

inherit cmake

DEPEND="
	dev-build/cmake
	dev-libs/tinyxml2
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DMSDFGEN_USE_SKIA=OFF
		-DMSDFGEN_USE_VCPKG=OFF
		-DBUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/msdfgen
}
