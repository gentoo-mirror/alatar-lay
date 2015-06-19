# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils cmake-utils

DESCRIPTION="Wal Commander GitHub Edition - Multi-platform open source file manager for Windows, Linux, FreeBSD and OS X "
HOMEPAGE="http://wcm.linderdaum.com/"
SRC_URI="https://github.com/corporateshark/WalCommander/archive/release-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="samba ssh truetype"
S="${WORKDIR}/WalCommander-release-${PV}"

DEPEND="x11-libs/libX11
	>=dev-util/cmake-2.8.0
	samba? ( net-fs/samba )
	ssh? ( net-libs/libssh2 )
	truetype? ( media-libs/freetype )"
RDEPEND="${DEPEND}"

src_unpack() {
    unpack ${A}
    ln -s "${S}/install-files" "${S}/src" || die
}

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_with samba SMBCLIENT)
		$(cmake-utils_use_with ssh LIBSSH2)
		$(cmake-utils_use_with truetype FREETYPE)
	)
	cmake-utils_src_configure
}
