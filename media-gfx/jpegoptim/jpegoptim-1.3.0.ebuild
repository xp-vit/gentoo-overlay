# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit toolchain-funcs

DESCRIPTION="Utility to optimize JPEG files"
HOMEPAGE="http://www.kokkonen.net/tjko/projects.html"
SRC_URI="https://github.com/tjko/jpegoptim/archive/RELEASE.${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux ~ppc-macos"

RDEPEND="virtual/jpeg"
DEPEND="${RDEPEND}"

src_configure() {
	tc-export CC
	econf
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	dodoc README
}
