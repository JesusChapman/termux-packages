TERMUX_PKG_HOMEPAGE=https://gitlab.gnome.org/GNOME/gcr
TERMUX_PKG_DESCRIPTION="Library for crypto UI and related tasks"
TERMUX_PKG_LICENSE="LGPL-2.0-or-later"
TERMUX_PKG_MAINTAINER="JesusChapman <developer@jesuschapman.me>"
TERMUX_PKG_VERSION=4.4.1
TERMUX_PKG_SRCURL=https://download.gnome.org/sources/gcr/${TERMUX_PKG_VERSION%%.*}/gcr-$TERMUX_PKG_VERSION.tar.xz
TERMUX_PKG_SHA256=c4442c15d4330f17a1f5194df08c576877af68412ab2521446a93bd5e24c931b
TERMUX_PKG_DEPENDS="glib, libgcrypt, libsecret, p11-kit"
TERMUX_PKG_BUILD_DEPENDS="g-ir-scanner, glib-cross"
TERMUX_PKG_VERSIONED_GIR=false
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dgtk4=false
-Dgtk_doc=false
-Dintrospection=true
-Dssh_agent=false
-Dsystemd=disabled
-Dvapi=false
"

termux_step_pre_configure() {
	termux_setup_gir

	export TERMUX_MESON_ENABLE_SOVERSION=1
}
