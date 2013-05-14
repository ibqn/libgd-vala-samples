#!/bin/bash
# Run this to generate all the initial makefiles, etc.

test -n "$srcdir" || srcdir=`dirname "$0"`
test -n "$srcdir" || srcdir=.

OLDDIR=`pwd`
cd $srcdir

AUTORECONF=`which autoreconf`
if test -z $AUTORECONF; then
    echo "*** No autoreconf found, please install it ***"
    exit 1
fi

INTLTOOLIZE=`which intltoolize`
if test -z $INTLTOOLIZE; then
    echo "*** No intltoolize found, please install the intltool package ***"
    exit 1
fi

git submodule update --init --recursive

#autopoint --force || exit $?
#AUTOPOINT='intltoolize --automake --copy' autoreconf --force --install --verbose
autoreconf --force --install --verbose

function die (){
	echo -e "\n$1"
	exit 0
}

cd $OLDDIR
test -n "$NOCONFIGURE" || "$srcdir/configure" --prefix='/home/ibqn/devel/libgd-vala/l-v-s-test' VALAC='/usr/bin/valac-0.20' VAPIGEN='/usr/bin/vapigen-0.20' "$@" || die "configure failed!"



make || die "make failed!"

die "just die"

make install "install failed!"
