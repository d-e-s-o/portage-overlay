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

DESCRIPTION="A trading bot for the Forex market using OANDA's REST API."
HOMEPAGE="https://github.com/d-e-s-o/fxBot"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux x86 x86-linux"
IUSE="+fxtool graphitize"

PYTHON_COMPAT=( python3_{2,3,4} )
inherit python-r1

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
  dev-python/oandapy[${PYTHON_USEDEP}]
  dev-python/mock[${PYTHON_USEDEP}]
  graphitize? ( dev-python/matplotlib[${PYTHON_USEDEP}] )"
RDEPEND="${DEPEND}"

inherit git-2
EGIT_BRANCH="devel"
EGIT_REPO_URI="/home/deso/local/src/fxBot/"
# TODO: We have the problem that rpigit is an alias that is defined for user
#       root only. The installation will run as user portage, however. I have
#       not found a way to switch users and so we likely have to introduce a
#       different access point for the clone to succeed.
#EGIT_REPO_URI="rpigit:~/git/fxBot.git"

inherit distutils-r1

python_prepare_all() {
  if ! use graphitize; then
    sed -i "/packages[ ]*=.*'graphitize'/{s/'graphitize'[ ]*[,]\?[ ]*//;}" setup.py
  fi
  if ! use fxtool; then
    sed -i "/packages[ ]*=.*'fxTool'/{s/'fxTool'[ ]*[,]\?[ ]*//;}" setup.py
  fi
  distutils-r1_python_prepare_all
}
