--- desktop/source/app/app.cxx.orig	2022-01-26 14:35:29 UTC
+++ desktop/source/app/app.cxx
@@ -538,6 +538,7 @@ void Desktop::InitFinished()
 
 void Desktop::DeInit()
 {
+    const CommandLineArgs& rCmdLineArgs = GetCommandLineArgs();
     try {
         // instead of removing of the configManager just let it commit all the changes
         utl::ConfigManager::storeConfigItems();
@@ -554,7 +555,9 @@ void Desktop::DeInit()
         // clear lockfile
         m_xLockfile.reset();
 
-        RequestHandler::Disable();
+        if ( !rCmdLineArgs.GetUnknown().isEmpty()
+                  || rCmdLineArgs.IsHelp() || rCmdLineArgs.IsVersion() )
+            RequestHandler::Disable();
         if( pSignalHandler )
             osl_removeSignalHandler( pSignalHandler );
     } catch (const RuntimeException&) {
