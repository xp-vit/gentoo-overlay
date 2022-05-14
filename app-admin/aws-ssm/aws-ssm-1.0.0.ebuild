# Copyright 2010-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"
inherit unpacker xdg

DESCRIPTION="Free calls, text and picture sharing with anyone, anywhere!"
HOMEPAGE="http://www.viber.com"
SRC_URI="
	amd64? ( https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb -> ${P}.deb )
"

IUSE=""
SLOT="0"
KEYWORDS="amd64"

QA_PREBUILT="*"

RESTRICT="mirror bindist strip"
RDEPEND="app-admin/awscli"

S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}
