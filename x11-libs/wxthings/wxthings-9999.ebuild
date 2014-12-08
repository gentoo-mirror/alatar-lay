# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
WX_GTK_VER="3.0"

inherit autotools flag-o-matic subversion wxwidgets

DESCRIPTION="wxThings is a variety of data containers and controls"
HOMEPAGE="http://wxcode.sourceforge.net/"
ESVN_REPO_URI="https://svn.code.sf.net/p/wxcode/code/trunk/wxCode/components/${PN}"
ESVN_REVISION="3101"
ESVN_PATCHES="${FILESDIR}/*.patch"
SRC_URI=""

LICENSE="wxWidgets licence"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/wxGTK:3.0[X]"
RDEPEND="${DEPEND}"

src_configure() {
    append-flags -fPIC -D_WX_FILEDLGG_H_

    econf \
        --with-wx-config="${WX_CONFIG}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}

