# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit flag-o-matic git-r3 cmake-utils

DESCRIPTION="Open source cross platform flash program for the STM factory preprogrammed bootloader"
HOMEPAGE="https://github.com/alatarum/stmflasher"
EGIT_REPO_URI="https://github.com/alatarum/${PN}"
EGIT_BRANCH="master"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#src_unpack(){
#	git_src_unpack || "src_unpack failed!"
#}

