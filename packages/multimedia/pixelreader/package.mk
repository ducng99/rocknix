# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2023-present ROCKNIX(https://github.com/ROCKNIX)

PKG_NAME="pixelreader"
PKG_VERSION="v1.1.0"
PKG_SITE="https://github.com/ducng99/pixel-reader"
PKG_URL="${PKG_SITE}/archive/refs/tags/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_image SDL2_ttf libxml2 libzip"
PKG_LONGDESC="An e-book reader."

pre_make_target() {
  MAKEFLAGS="${MAKEFLAGS} -j"

  export PLATFORM=rocknix
  export PREFIX=${TOOLCHAIN}

  if [ ! "${TARGET_ARCH}" = "x86_64" ]; then
    CPPFLAGS="${CPPFLAGS} -DSDL_DISABLE_IMMINTRIN_H=ON"
  fi
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin

  cp -P ${PKG_BUILD}/build/reader ${INSTALL}/usr/bin/pixelreader
  chmod 0755 ${INSTALL}/usr/bin/pixelreader
}

post_makeinstall_target() {
  cp -Pf ${PKG_DIR}/scripts/start_pixelreader.sh ${INSTALL}/usr/bin/
  chmod 0755 ${INSTALL}/usr/bin/start_pixelreader.sh

  mkdir -p ${INSTALL}/usr/config/pixelreader/resources/fonts
  cp -PR ${PKG_BUILD}/resources/fonts ${INSTALL}/usr/config/pixelreader/resources/
}
