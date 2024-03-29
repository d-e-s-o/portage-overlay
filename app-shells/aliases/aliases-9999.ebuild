#/***************************************************************************
# *   Copyright (C) 2018-2021 Daniel Mueller (deso@posteo.net)              *
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

EAPI=8

DESCRIPTION="Commonly used shell aliases."
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="arm amd64 amd64-linux"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_unpack() {
  mkdir --parents "${S}"
}

src_install() {
  cat <<EOF > aliases.fish
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias ..........='cd ../../../../../../../../..'
alias ...........='cd ../../../../../../../../../..'
alias ............='cd ../../../../../../../../../../..'
alias .............='cd ../../../../../../../../../../../..'
alias ..............='cd ../../../../../../../../../../../../..'
alias l='ls -l --all --group-directories-first'
alias ll='ls -l --all --group-directories-first --recursive'
alias rl='readlink --canonicalize-existing'
alias g='git'
alias v='nvim'
alias hexdump='hexdump --canonical'
alias info='info --vi-keys'
alias fd='fd --follow --no-ignore'
alias rg='rg --follow --unrestricted --ignore-case'
alias sub='sudo --login fish'
alias passc='pass show --clip'
EOF

  insinto ${EROOT}usr/share/fish/vendor_conf.d/
  insopts -m0755
  newins ${PN}.fish ${PN}.fish
}
