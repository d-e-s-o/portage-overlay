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

EAPI=6

DESCRIPTION="Ofx file format parser for Python."
HOMEPAGE="https://github.com/jseutter/ofxparse"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 amd64-linux"

PYTHON_COMPAT=( python3_{5,6} )
inherit python-r1
inherit distutils-r1

RDEPEND="
  ${PYTHON_DEPS}
  dev-python/beautifulsoup[${PYTHON_USEDEP}]
"
DEPEND="
  ${RDEPEND}
  dev-python/setuptools[${PYTHON_USEDEP}]
"

EGIT_COMMIT="cae2eef2f2424c0ef0a59992c97624a3d8744013"
EGIT_REPO_URI="https://github.com/jseutter/ofxparse.git"

inherit git-r3
