From 7cfb47c7614b01ee4b4ccb881f0ab37e9e2e497d Mon Sep 17 00:00:00 2001
From: jlorber <jlorber@linagora.com>
Date: Tue, 04 Mar 2025 12:12:41 +0100
Subject: [PATCH] tdf#151166 add missing Numbers function names

Change-Id: I5f01e4f1412cf2d4a679fbf5d511475cf04c77ee
Reviewed-on: https://gerrit.libreoffice.org/c/libetonyek/+/182473
Tested-by: Ilmari Lauhakangas <ilmari.lauhakangas@libreoffice.org>
Reviewed-by: Ilmari Lauhakangas <ilmari.lauhakangas@libreoffice.org>
--- src/lib/IWAParser.cpp.orig	2024-11-05 21:56:01 UTC
+++ src/lib/IWAParser.cpp
@@ -3593,7 +3593,16 @@ bool IWAParser::parseFormula(const IWAMessage &msg, IW
           {285, "Union.Ranges"},
           {286, "SeriesSum"}, {287, "Polynomial"}, {288, "WeiBull"},
           {297, "PlainText"}, {298, "Stock"}, {299, "StockH"}, {300, "Currency"},
-          {301, "CurrencyH"}, {302, "CurrencyConvert"}, {303, "CurrencyCode"}
+          {301, "CurrencyH"}, {302, "CurrencyConvert"}, {303, "CurrencyCode"},
+	  {304, "IsNumber"}, {305, "IsText"}, {306, "IsDate"},
+	  {309, "MaxIfs"}, {310, "MinIfs"}, {311, "XIRR"}, {312, "XNPV"}, {313, "Ifs"},
+	  {314, "XLookup"}, {315, "XMatch"}, {316, "Subtotal"}, {317, "CountMatches"},
+	  {318, "TextBefore"}, {319, "TextBetween"}, {320, "TextAfter"},
+	  {321, "Regex"}, {322, "Reference.Name"}, {323, "FormulaText"}, {324, "Regex.Extract"},
+	  {325, "GetPivotData"}, {328, "TextJoin"}, {329, "Concat"},
+	  {330, "BitAnd"}, {331, "BitOr"}, {332, "BitXor"}, {333, "BitLShift"}, {334, "BitRShift"},
+	  {335, "ISOWeekNum"}, {336, "Switch"}
+
         };
         Formula child;
         std::ostringstream s;
