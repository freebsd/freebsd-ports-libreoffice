--- basic/source/runtime/methods.cxx.orig	2022-01-26 14:35:29 UTC
+++ basic/source/runtime/methods.cxx
@@ -96,6 +96,7 @@ using namespace com::sun::star::uno;
 #include <stdio.h>
 #include <stdlib.h>
 #include <errno.h>
+#include <unistd.h>
 
 #include <sbobjmod.hxx>
 #include <sbxmod.hxx>
