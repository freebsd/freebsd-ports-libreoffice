--- vcl/qt5/Qt5Frame.cxx.orig	2020-05-13 11:19:20 UTC
+++ vcl/qt5/Qt5Frame.cxx
@@ -296,7 +296,7 @@ SalGraphics* Qt5Frame::AcquireGraphics()
 
     if (m_bUseCairo)
     {
-        if (!m_pSvpGraphics || m_bGraphicsInvalid)
+        if (!m_pSvpGraphics)
         {
             QSize aSize = m_pQWidget->size() * devicePixelRatioF();
             m_pSvpGraphics.reset(new Qt5SvpGraphics(this));
