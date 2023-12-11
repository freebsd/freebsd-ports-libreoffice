--- external/skia/UnpackedTarball_skia.mk.orig	2023-11-30 13:04:41 UTC
+++ external/skia/UnpackedTarball_skia.mk
@@ -40,6 +40,7 @@ skia_patches := \
     incomplete.patch.0 \
     ubsan-missing-typeinfo.patch.1 \
     incomplete-type-SkImageGenerator.patch.1 \
+    powerpc64le-skia.patch.0 \
 
 $(eval $(call gb_UnpackedTarball_set_patchlevel,skia,1))
 
