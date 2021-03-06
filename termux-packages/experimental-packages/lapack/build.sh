TERMUX_PKG_HOMEPAGE=http://www.netlib.org/lapack/
TERMUX_PKG_DESCRIPTION="Linear Algebra PACKage"
TERMUX_PKG_VERSION=3.7.0
TERMUX_PKG_SRCURL=http://www.netlib.org/lapack/lapack-${TERMUX_PKG_VERSION}.tgz
export FC=${TERMUX_HOST_PLATFORM}-gfortran
termux_step_configure () {
	cd $TERMUX_PKG_BUILDDIR
	cmake -G "Unix Makefiles" $TERMUX_PKG_SRCDIR \
		-DCMAKE_AR=`which ${TERMUX_HOST_PLATFORM}-ar` \
		-DCMAKE_BUILD_TYPE=MinSizeRel \
		-DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
		-DCMAKE_CROSSCOMPILING=True \
		-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
		-DCMAKE_FIND_ROOT_PATH=$TERMUX_PREFIX \
		-DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=ONLY \
		-DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=ONLY \
		-DCMAKE_INSTALL_PREFIX=$TERMUX_PREFIX \
		-DCMAKE_LINKER=`which ${TERMUX_HOST_PLATFORM}-ld` \
		-DCMAKE_MAKE_PROGRAM=`which make` \
		-DCMAKE_RANLIB=`which ${TERMUX_HOST_PLATFORM}-ranlib` \
		-DCMAKE_SKIP_INSTALL_RPATH=ON \
		-DCMAKE_SYSTEM_NAME=Android \
		-DCMAKE_USE_SYSTEM_LIBRARIES=True \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DBUILD_SHARED_LIBS=ON \
		-DLAPACKE=ON
}
