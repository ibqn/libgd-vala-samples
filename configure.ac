#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([libgd-vala-samples], [0.1])
AM_INIT_AUTOMAKE([1.13 foreign no-dist-gzip dist-xz])
AC_CONFIG_SRCDIR([src/test-header-bar.vala])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_HEADERS([config.h])

# Simplifies the verbosity of the compilation output.
# m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES([yes])])

# Checks for programs.
AC_PROG_CC
AM_PROG_VALAC([0.20])
# Checks for libraries.

PKG_PROG_PKG_CONFIG([0.22])

# Checks for modules.
pkg_modules="glib-2.0 \
             gobject-2.0 \
             gtk+-3.0"

PKG_CHECK_MODULES(LIBGD_VALA_SAMPLES, [$pkg_modules])
# This variables are defined by pkg-config modules
# AC_SUBST(LIBGD_VALA_SAMPLES_CFLAGS)
# AC_SUBST(LIBGD_VALA_SAMPLES_LIBS)

LT_INIT([disable-static])

LIBGD_INIT([
    static
    header-bar
    stack
    revealer
    vapi
    gi
])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile
                 libgd/Makefile
                 src/Makefile])
AC_OUTPUT

echo "
 
configuration summary:
 
for package: ${PACKAGE}, Ver.: ${VERSION}

source code location ......... ${srcdir} 
compiler:..................... ${CC}
valac:........................ ${VALAC}
vapigen:...................... ${VAPIGEN}
prefix:....................... ${prefix}
compiler flags ..............: ${CFLAGS}
compiler pre-processor falgs : ${CPPFLAGS}
"
