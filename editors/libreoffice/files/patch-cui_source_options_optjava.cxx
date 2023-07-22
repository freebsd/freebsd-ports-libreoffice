From 8b330bb761e05fcfabd5a30f8784046c93b91431 Mon Sep 17 00:00:00 2001
From: Miklos Vajna <vmiklos@collabora.com>
Date: Wed, 21 Jun 2023 16:16:57 +0200
Subject: [PATCH] cui: don't build SvxJavaClassPathDlg::SetClassPath() for the
 non-java case

Since SvxJavaClassPathDlg::SetClassPath  is only called from #if
HAVE_FEATURE_JAVA  code (in IMPL_LINK_NOARG(SvxJavaOptionsPage,
ClassPathHdl_Impl, weld::Button&, void)  in
cui/source/options/optjava.cxx ) anyway, see
<https://gerrit.libreoffice.org/c/core/+/153386/2#message-06ee95be419a14ee8f08035142b5718e0377d120>.

Change-Id: I0e5a21036ce048c18d408c07cce088dbab7fc030
Reviewed-on: https://gerrit.libreoffice.org/c/core/+/153396
Reviewed-by: Miklos Vajna <vmiklos@collabora.com>
Tested-by: Jenkins
---
 cui/source/options/optjava.cxx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git cui/source/options/optjava.cxx cui/source/options/optjava.cxx
index 7a537dfe4eed..64ba41c3fe0b 100644
--- cui/source/options/optjava.cxx
+++ cui/source/options/optjava.cxx
@@ -935,12 +935,12 @@ OUString SvxJavaClassPathDlg::GetClassPath() const
     return sPath.makeStringAndClear();
 }
 
+#if HAVE_FEATURE_JAVA
 void SvxJavaClassPathDlg::SetClassPath( const OUString& _rPath )
 {
     if ( m_sOldPath.isEmpty() )
         m_sOldPath = _rPath;
     m_xPathList->clear();
-#if HAVE_FEATURE_JAVA
     if (!_rPath.isEmpty())
     {
         std::vector paths = jfw_convertUserPathList(_rPath);
@@ -962,8 +962,8 @@ void SvxJavaClassPathDlg::SetClassPath( const OUString& _rPath )
         // select first entry
         m_xPathList->select(0);
     }
-#endif
     SelectHdl_Impl(*m_xPathList);
 }
+#endif
 
 /* vim:set shiftwidth=4 softtabstop=4 expandtab: */
-- 
2.41.0

