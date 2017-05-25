#/***************************************************************************
# *   Copyright (C) 2017 Daniel Mueller (deso@posteo.net)                   *
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

DESCRIPTION="A scripting library for tmux written in Python."
HOMEPAGE="https://github.com/tony/libtmux"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 amd64-linux"

PYTHON_COMPAT=( python3_4 )
inherit python-r1
inherit distutils-r1

RDEPEND=""
DEPEND="${RDEPEND}"

EGIT_COMMIT="v0.7.1"
EGIT_REPO_URI="https://github.com/tony/libtmux.git"

inherit git-2
