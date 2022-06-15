--- external/skia/UnpackedTarball_skia.mk.orig	2022-05-12 13:26:05 UTC
+++ external/skia/UnpackedTarball_skia.mk
@@ -37,6 +37,7 @@ skia_patches := \
     fix-graphite-ifdef.patch.1 \
     allow-no-es2restrictions.patch.1 \
     vk_mem_alloc.patch.1 \
+    gfx-skia-skia-src-core-SkCpu.cpp.patch.0 \
 
 $(eval $(call gb_UnpackedTarball_set_patchlevel,skia,1))
 
