# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="$(ver_rs 3 a)"

DESCRIPTION="A fork of password-store using age as encryption backend"
HOMEPAGE="https://github.com/FiloSottile/passage"
SRC_URI="https://github.com/FiloSottile/${PN}/archive/refs/tags/${MY_PV}.tar.gz"

S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

IUSE="wayland git"

RDEPEND="
	app-crypt/rage
	app-shells/bash
	>=app-text/tree-1.7.0
	sys-apps/coreutils
	wayland? ( gui-apps/wl-clipboard )
	git? ( dev-vcs/git )
"

src_prepare() {
	default

	for patch in "${FILESDIR}"/*.patch; do
		eapply "$patch"
	done
}

src_install() {
	default

	mv "${ED}"/usr/share/fish/vendor_completions.d/passage.fish "${ED}"/usr/share/fish/vendor_completions.d/pass.fish

	cat <<-'EOF' > pass
	#!/usr/bin/env sh
	PASSAGE_AGE="age-gpg" passage "$@"
	EOF

	exeinto /usr/bin/
	newexe pass pass


	cat <<-'EOF' > age-gpg
	#!/usr/bin/env bash

	# Array to hold arguments for the real `age`.
	args=()
	identity_file=""

	# Parse all arguments.
	while [[ $# -gt 0 ]]; do
	    case "$1" in
	        -i|--identity)
	            # The next argument is the identity file. Remember and then
	            # remove it.
	            identity_file="$2"
	            shift 2
	            ;;
	        *)
	            # Keep all other arguments
	            args+=("$1")
	            shift
	            ;;
	    esac
	done

	if [[ -n "$identity_file" ]]; then
	    # If an identity argument was found, assume the corresponding file
	    # is GPG encrypted, decrypt it transparently, and pass it to `age`
	    # via stdin (this assumes no other `age` argument requires reading
	    # from stdin, which empirically seems to be the case).
	    gpg --decrypt "${identity_file}.gpg" 2> /dev/null | age "${args[@]}" -i -
	else
	    # No identity file specified, just call `age` normally.
	    exec age "${args[@]}"
	fi
	EOF

	exeinto /usr/bin/
	newexe age-gpg age-gpg
}
