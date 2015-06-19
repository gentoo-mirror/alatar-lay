# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
WX_GTK_VER="3.0"

inherit autotools flag-o-matic subversion wxwidgets

DESCRIPTION="wxPlotCtrl is a interactive xy data plotting widgets"
HOMEPAGE="http://wxcode.sourceforge.net/"
ESVN_REPO_URI="https://svn.code.sf.net/p/wxcode/code/trunk/wxCode/components/${PN}"
ESVN_REVISION="3131"
ESVN_PATCHES="${FILESDIR}/*.patch"
SRC_URI=""

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/wxGTK:3.0[X]
	x11-libs/wxthings"
RDEPEND="${DEPEND}"

src_configure() {
	append-flags -fPIC -DwxPLOTCTRL_FAST_GRAPHICS=0

    econf \
        --with-wx-config="${WX_CONFIG}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

