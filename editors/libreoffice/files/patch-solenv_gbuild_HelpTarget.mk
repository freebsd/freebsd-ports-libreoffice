--- solenv/gbuild/HelpTarget.mk.orig	2025-11-20 20:45:20 UTC
+++ solenv/gbuild/HelpTarget.mk
@@ -114,10 +114,10 @@ $(call gb_HelpTranslateTarget_get_target,%) :
 $(call gb_HelpTranslateTarget_get_target,%) :
 	$(call gb_Output_announce,$*,$(true),XHP,2)
 	$(call gb_Trace_MakeMark,$*,XHP)
-	touch $@
+	mkdir -p $(@D) && touch $@
 
 $(call gb_HelpTranslateTarget__get_any_translated_target,%) :
-	touch $@
+	mkdir -p $(@D) && touch $@
 
 .PHONY : $(call gb_HelpTranslateTarget_get_clean_target,%)
 $(call gb_HelpTranslateTarget_get_clean_target,%) :
