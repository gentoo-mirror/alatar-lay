# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

WX_GTK_VER="3.0"

inherit autotools flag-o-matic subversion wxwidgets

DESCRIPTION="wxFreeChart is the free crossplatform chart library based on wxWidgets"
HOMEPAGE="http://wxcode.sourceforge.net/"
ESVN_REPO_URI="https://wxcode.svn.sourceforge.net/svnroot/wxcode/trunk/wxCode/components/freechart"
SRC_URI=""

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS=""
IUSE="examples doc"



DEPEND="
	 x11-libs/wxGTK:3.0[X]" 
RDEPEND="${DEPEND}"

src_configure() {
    econf \
        --with-wx-config="${WX_CONFIG}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	use examples && (insinto /usr/share/doc/${PF}/examples
				doins sample/*)
	use doc && (dodoc website/docs/*)
#	use examples && (dodir /usr/share/doc/${PF}
#				cp -frpv sample ${D}/usr/share/doc/${PF}/)
}

