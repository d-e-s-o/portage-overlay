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

CRATES="
bitflags-0.7.0
cargo-expand-0.3.12
fuchsia-zircon-0.2.1
fuchsia-zircon-sys-0.2.0
isatty-0.1.5
kernel32-sys-0.2.2
libc-0.2.33
rand-0.3.18
tempdir-0.3.5
winapi-0.2.8
winapi-build-0.1.1
"

inherit cargo

DESCRIPTION="Wrapper around rustc --pretty=expanded. Shows the result of macro expansion and #[derive] expansion."
HOMEPAGE="https://github.com/dtolnay/cargo-expand"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="MIT/Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""
