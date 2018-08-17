
dnl The dlopen library
dnl
dnl Copyright (C) 2018 Red Hat, Inc.
dnl
dnl This library is free software; you can redistribute it and/or
dnl modify it under the terms of the GNU Lesser General Public
dnl License as published by the Free Software Foundation; either
dnl version 2.1 of the License, or (at your option) any later version.
dnl
dnl This library is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
dnl Lesser General Public License for more details.
dnl
dnl You should have received a copy of the GNU Lesser General Public
dnl License along with this library.  If not, see
dnl <http://www.gnu.org/licenses/>.
dnl

AC_DEFUN([LIBVIRT_CHECK_UNISTRING], [

  with_u8_strwidth=yes
  with_uniwidth=yes

  old_CFLAGS="$CFLAGS"
  old_LIBS="$LIBS"

  LIBS=""
  AC_CHECK_HEADER([uniwidth.h],, [with_uniwidth=no])
  AC_SEARCH_LIBS([u8_strwidth], [unistring],, [with_u8_strwidth=no])
  UNISTRING_LIBS="$LIBS"

  CFLAGS="$old_CFLAGS"
  LIBS="$old_LIBS"

  AC_SUBST([UNISTRING_LIBS])
])

AC_DEFUN([LIBVIRT_RESULT_UNISTRING], [
  LIBVIRT_RESULT_LIB([UNISTRING])
])
