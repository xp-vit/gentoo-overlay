# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 go-module

DESCRIPTION="Feature-rich Interactive Jira Command Line"
HOMEPAGE="https://github.com/ankitpokhrel/jira-cli"

SRC_URI="https://github.com/ankitpokhrel/jira-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://github.com/xp-vit/gentoo-overlay/raw/master/app-misc/jira-cli/files/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/jira-cli-${PV}"

src_compile() {
	ego build ./cmd/jira
	./jira completion zsh > jira.zsh || die
	./jira completion bash > jira.bash || die
	./jira man --generate --output docs || die
}

src_install() {
	dobin jira
	dodoc -r docs

	newbashcomp jira.bash jira
	insinto /usr/share/zsh/site-functions
	newins jira.zsh _jira
}

src_test() {
        go test -work || die "test failed"
}