#/***************************************************************************
# *   Copyright (C) 2014 Daniel Mueller                                     *
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

EAPI=5

inherit git-2

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4} )
inherit python-r1

DESCRIPTION="Wrapper around OANDA's REST API for Foreign Exchange trading"
HOMEPAGE="https://github.com/oanda/oandapy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"
IUSE=""

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"


src_unpack() {
  python_unpack() {
    # the official oanda repository has no python3 support and we do not want to
    # patch here, so just pull the forked version in that case
    # TODO: for multiple python2 or python3 version we clone the source
    #       repository multiple times -- fix this
    if [[ $EPYTHON == python2* ]]; then
      EGIT_REPO_URI="
        https://github.com/oanda/oandapy.git
        git@github.com:oanda/oandapy.git"
      EGIT_BRANCH="master"
    else
      EGIT_REPO_URI="
        https://github.com/d-e-s-o/oandapy.git
        git@github.com:d-e-s-o/oandapy.git"
      EGIT_BRANCH="fixPython3"
    fi

    # apparently the directory ${S} must exist, otherwise the prepare phase
    # fails
    mkdir -p "${S}"

    EGIT_COMMIT="${EGIT_BRANCH}"
    EGIT_SOURCEDIR="${S}_${EPYTHON}"
    git-2_src_unpack
  }

  python_foreach_impl python_unpack
}

src_prepare() {
  true
}

src_compile() {
  true
}

src_install() {
  python_install() {
    python_export PYTHON_SITEDIR
    insinto "${PYTHON_SITEDIR}/${PN}/"
    doins "${S}_${EPYTHON}/oandapy.py"
    dosym "${PYTHON_SITEDIR}/${PN}/oandapy.py" "${PYTHON_SITEDIR}/oandapy.py"
  }
  python_foreach_impl python_install
}
