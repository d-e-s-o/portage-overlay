# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# please keep this ebuild at EAPI 8 -- sys-apps/portage dep
EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_TESTED=( python3_{10..13} pypy3 )
PYTHON_COMPAT=( "${PYTHON_TESTED[@]}" )
PYTHON_REQ_USE="ssl(+)"

inherit distutils-r1 pypi

DESCRIPTION="HTTP library with thread-safe connection pooling, file post, and more"
HOMEPAGE="
	https://github.com/urllib3/urllib3/
	https://pypi.org/project/urllib3/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE="brotli test"
RESTRICT="!test? ( test )"

# dev-python/{pyopenssl,cryptography,idna,certifi} are optional runtime
# dependencies. Do not add them to RDEPEND. They should be unnecessary with
# modern versions of python (>= 3.2).
RDEPEND="
	>=dev-python/pysocks-1.5.8[${PYTHON_USEDEP}]
	<dev-python/pysocks-2.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	brotli? ( dev-python/brotlicffi[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		$(python_gen_cond_dep "
			${RDEPEND}
			dev-python/brotlicffi[\${PYTHON_USEDEP}]
			dev-python/mock[\${PYTHON_USEDEP}]
			dev-python/pytest[\${PYTHON_USEDEP}]
			dev-python/pytest-freezegun[\${PYTHON_USEDEP}]
			>=dev-python/tornado-4.2.1[\${PYTHON_USEDEP}]
			>=dev-python/trustme-0.5.3[\${PYTHON_USEDEP}]
		" "${PYTHON_TESTED[@]}")
	)
"

src_prepare() {
	distutils-r1_src_prepare

	# unbundle urllib3
	rm src/urllib3/packages/six.py || die
	find -name '*.py' -exec sed -i \
		-e 's:\([.]*\|urllib3\.\)\?packages\.six:six:g' \
		-e 's:from \([.]*\|urllib3\.\)\?packages import six:import six:g' \
		{} + || die
}

python_test() {
	local -x CI=1
	if ! has "${EPYTHON}" "${PYTHON_TESTED[@]/_/.}"; then
		einfo "Skipping tests on ${EPYTHON}"
		return
	fi

	local EPYTEST_DESELECT=(
		# unstable (relies on warning count)
		test/with_dummyserver/test_proxy_poolmanager.py::TestHTTPProxyManager::test_proxy_verified_warning
		# some random overflow
		test/with_dummyserver/test_socketlevel.py::TestSSL::test_requesting_large_resources_via_ssl
	)
	has "${EPYTHON}" python3.{8..10} && EPYTEST_DESELECT+=(
		test/contrib/test_pyopenssl.py::TestPyOpenSSLHelpers::test_get_subj_alt_name
	)

	epytest
}
