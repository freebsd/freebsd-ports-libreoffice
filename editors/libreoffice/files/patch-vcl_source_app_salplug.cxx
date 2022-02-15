--- vcl/source/app/salplug.cxx.orig	2022-01-26 14:35:29 UTC
+++ vcl/source/app/salplug.cxx
@@ -175,6 +175,7 @@ SalInstance* autodetect_plugin()
 #if ENABLE_KF5
         "kf5",
 #endif
+        "qt5",
 #if ENABLE_GTK3_KDE5
         "gtk3_kde5",
 #endif
@@ -183,7 +184,7 @@ SalInstance* autodetect_plugin()
 
     static const char* const pStandardFallbackList[] =
     {
-        "gtk3", "gen", nullptr
+        "gtk3", "qt5", "gen", nullptr
     };
 
 #ifdef HEADLESS_VCLPLUG
