--- external/skia/UnpackedTarball_skia.mk.orig	2022-01-13 03:09:02.000000000 +0800
+++ external/skia/UnpackedTarball_skia.mk	2022-01-19 03:55:20.647187000 +0800
@@ -37,6 +37,7 @@
     disable-freetype-colrv1.1 \
     windows-libraries-system32.patch.1 \
     fix-graphite-ifdef.patch.1 \
+    gfx-skia-skia-src-core-SkCpu.cpp.patch.0 \
 
 $(eval $(call gb_UnpackedTarball_set_patchlevel,skia,1))
 
