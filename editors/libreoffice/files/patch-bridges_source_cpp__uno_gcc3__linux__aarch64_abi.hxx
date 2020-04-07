--- bridges/source/cpp_uno/gcc3_linux_aarch64/abi.hxx.bak	2020-04-06 15:45:54.423180000 +0200
+++ bridges/source/cpp_uno/gcc3_linux_aarch64/abi.hxx	2020-04-06 15:46:21.321958000 +0200
@@ -64,6 +64,7 @@ class __si_class_type_info: public __class_type_info {
 }
 #endif
 
+#if !defined(__FreeBSD__)
 #if !HAVE_CXXABI_H_CXA_EXCEPTION
 // <https://mentorembedded.github.io/cxx-abi/abi-eh.html>,
 // libcxxabi/src/cxa_exception.hpp:
@@ -88,6 +89,7 @@ struct __cxa_exception {
     _Unwind_Exception unwindHeader;
 };
 }
+#endif
 #endif
 
 #if !HAVE_CXXABI_H_CXA_EH_GLOBALS
