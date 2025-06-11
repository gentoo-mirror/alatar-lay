# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker xdg-utils desktop

DESCRIPTION="Shadowrun 6e TTRPG character management application"
HOMEPAGE="https://commlink.rocks/"
SRC_URI="https://www.rpgframework.de/${PN}-builds/linux/CommLink6-jre-${PV}.deb"

S="${WORKDIR}"

LICENSE="all-rights-reserved"
SLOT=0
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
	sys-libs/zlib
"

QA_PREBUILT="opt/${PN}/*"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	# Because here is only one file: "copyright", no docs
	rm -rf "opt/${PN}/share/doc/" || die

	# Fix invalid Category "RPGFramework" and then install desktop file
	sed -e "s|^Categories=.*|Categories=Game|" -i "opt/${PN}/lib/commlink6-Commlink6.desktop" || die
	domenu "opt/${PN}/lib/commlink6-Commlink6.desktop"
	rm -f "opt/${PN}/lib/commlink6-Commlink6.desktop" || die

	doins -r opt
	fperms +x "/opt/${PN}/bin/Commlink6"
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
