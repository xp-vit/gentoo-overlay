# Copyright 2010-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"
inherit rpm

DESCRIPTION="AWS ession Manager plugin on Linux"
HOMEPAGE="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html#install-plugin-linux"
SRC_URI="
	amd64? ( https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm -> ${P}.rpm )
"

IUSE=""
SLOT="0"
KEYWORDS="amd64"

RDEPEND="app-admin/awscli"

QA_PREBUILT="opt/ssm/*"

S="${WORKDIR}"

src_install() {
        mv "${S}"/* "${ED}" || die
}
