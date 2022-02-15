--- external/skia/Library_skia.mk.orig	2022-01-26 14:35:29 UTC
+++ external/skia/Library_skia.mk
@@ -95,7 +95,7 @@ $(eval $(call gb_Library_use_externals,skia,\
     libpng \
 ))
 
-ifeq ($(OS),LINUX)
+ifneq (,$(filter DRAGONFLY FREEBSD LINUX NETBSD OPENBSD,$(OS)))
 $(eval $(call gb_Library_add_libs,skia,\
     -lm \
     -ldl \
