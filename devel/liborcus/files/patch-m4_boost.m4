--- m4/boost.m4.orig	2025-05-24 00:16:07 UTC
+++ m4/boost.m4
@@ -1234,11 +1236,16 @@ BOOST_DEFUN([String_Algo],
 # --------------------------------
 # Look for Boost.System.  For the documentation of PREFERRED-RT-OPT, see the
 # documentation of BOOST_FIND_LIB above.  This library was introduced in Boost
-# 1.35.0.
+# 1.35.0 and is header only since 1.70.
 BOOST_DEFUN([System],
-[BOOST_FIND_LIB([system], [$1],
+[
+if test $boost_major_version -ge 170; then
+  BOOST_FIND_HEADER([boost/system/error_code.hpp])
+else
+  BOOST_FIND_LIB([system], [$1],
                 [boost/system/error_code.hpp],
                 [boost::system::error_code e; e.clear();])
+fi
 ])# BOOST_SYSTEM
 
 
