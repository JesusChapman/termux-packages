TERMUX_PKG_HOMEPAGE=https://github.com/jax-ml/ml_dtypes
TERMUX_PKG_DESCRIPTION="Stand-alone NumPy dtype extensions for machine learning"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="JesusChapman <developer@jesuschapman.me>"
TERMUX_PKG_VERSION="0.7.0"
TERMUX_PKG_SRCURL=git+https://github.com/jax-ml/ml_dtypes
TERMUX_PKG_GIT_BRANCH=v0.7.0
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_UPDATE_TAG_TYPE="latest-release-tag"
TERMUX_PKG_DEPENDS="libc++, python, python-numpy, python-pip"
TERMUX_PKG_PYTHON_COMMON_BUILD_DEPS="wheel, scikit-build-core"
TERMUX_PKG_BUILD_IN_SRC=true

_NUMPY_VERSION=$(. $TERMUX_SCRIPTDIR/packages/python-numpy/build.sh; echo $TERMUX_PKG_VERSION)
TERMUX_PKG_PYTHON_CROSS_BUILD_DEPS="'numpy==$_NUMPY_VERSION'"

termux_step_pre_configure() {
	termux_setup_cmake
	termux_setup_ninja
}

termux_step_configure() {
	:
}

termux_step_make_install() {
	pip install --no-build-isolation --no-deps --prefix "$TERMUX_PREFIX" "$TERMUX_PKG_SRCDIR"
}
