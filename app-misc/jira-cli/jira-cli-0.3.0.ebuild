# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 go-module

DESCRIPTION=" Feature-rich Interactive Jira Command Line"
HOMEPAGE="https://github.com/ankitpokhrel/jira-cli"

EGO_SUM=(
    "github.com/AlecAivazis/survey/v2 v2.3.2"
	"github.com/atotto/clipboard v0.1.4"
	"github.com/briandowns/spinner v1.16.0"
	"github.com/charmbracelet/glamour v0.3.0"
	"github.com/cli/safeexec v1.0.0"
	"github.com/fatih/color v1.13.0"
	"github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1"
	"github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510"
	"github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51"
	"github.com/kentaro-m/blackfriday-confluence v0.0.0-20210619074151-1628b53c6f29"
	"github.com/kr/text v0.2.0"
	"github.com/mgutz/ansi v0.0.0-20200706080929-d51e80ef957d"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/pkg/browser v0.0.0-20210911075715-681adbf594b8"
	"github.com/rivo/tview v0.0.0-20211029142923-a4acb08f513e"
	"github.com/russross/blackfriday/v2 v2.1.0"
	"github.com/spf13/cobra v1.2.1"
	"github.com/spf13/viper v1.9.0"
	"github.com/stretchr/testify v1.7.0"
    "github.com/alecthomas/chroma v0.9.4"
    "github.com/aymerick/douceur v0.2.0"
    "github.com/cpuguy83/go-md2man/v2 v2.0.1"
    "github.com/davecgh/go-spew v1.1.1"
    "github.com/dlclark/regexp2 v1.4.0"
    "github.com/fsnotify/fsnotify v1.5.1"
    "github.com/gdamore/encoding v1.0.0"
    "github.com/gorilla/css v1.0.0"
    "github.com/hashicorp/hcl v1.0.0"
    "github.com/inconshreveable/mousetrap v1.0.0"
    "github.com/lucasb-eyer/go-colorful v1.2.0"
    "github.com/magiconair/properties v1.8.5"
    "github.com/mattn/go-colorable v0.1.11"
    "github.com/mattn/go-isatty v0.0.14"
    "github.com/mattn/go-runewidth v0.0.13"
    "github.com/microcosm-cc/bluemonday v1.0.16"
    "github.com/mitchellh/mapstructure v1.4.2"
    "github.com/muesli/reflow v0.3.0"
    "github.com/muesli/termenv v0.9.0"
    "github.com/olekukonko/tablewriter v0.0.5"
    "github.com/pelletier/go-toml v1.9.4"
    "github.com/pmezard/go-difflib v1.0.0"
    "github.com/rivo/uniseg v0.2.0"
    "github.com/spf13/afero v1.6.0"
    "github.com/spf13/cast v1.4.1"
    "github.com/spf13/jwalterweatherman v1.1.0"
    "github.com/spf13/pflag v1.0.5"
    "github.com/subosito/gotenv v1.2.0"
    "github.com/yuin/goldmark v1.4.2"
    "github.com/yuin/goldmark-emoji v1.0.1"
    "golang.org/x/net v0.0.0-20211105192438-b53810dc28af"
    "golang.org/x/sys v0.0.0-20211105183446-c75c47738b0c"
    "golang.org/x/term v0.0.0-20210927222741-03fcf44c2211"
    "golang.org/x/text v0.3.7"
    "gopkg.in/ini.v1 v1.63.2"
    "gopkg.in/yaml.v2 v2.4.0"
    "gopkg.in/yaml.v3 v3.0.0-20210107192922-496545a6307b"
)

go-module_set_globals

SRC_URI="https://github.com/ankitpokhrel/jira-cli/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
        ${EGO_SUM_SRC_URI}"
#SRC_URI+=" https://github.com/xp-vit/gentoo-overlay/raw/master/app-misc/jira-cli/files/${P}-deps.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/jira-cli-${PV}"

src_compile() {
	ego build ./cmd/jira
	./jira completion zsh > jira.zsh || die
	./jira completion bash > jira.bash || die
}

src_install() {
	dobin jira
	dodoc README.md

	newbashcomp jira.bash jira
	insinto /usr/share/zsh/site-functions
	newins jira.zsh _jira
}

src_test() {
        go test -work || die "test failed"
}