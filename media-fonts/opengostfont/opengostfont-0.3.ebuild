# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Open-source version of the fonts by Russian standard GOST 2.304-81 Letters for drawings"
HOMEPAGE="https://bitbucket.org/fat_angel/opengostfont"
SRC_URI="https://bitbucket.org/fat_angel/${PN}/downloads/${PN}-ttf-${PV}.tar.xz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/xz-utils"
RDEPEND=""

S="${WORKDIR}/${PN}-ttf-${PV}"
FONT_S="${S}"
FONT_SUFFIX="ttf"
