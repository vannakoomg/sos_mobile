import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColor.secondnaryColor.withOpacity(0.6),
      selectionHandleColor: const Color(0xff64b5f6),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.mainColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColor.textFirst,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    primaryColor: AppColor.textFirst,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColor.textFirst, fontSize: 25, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
        color: AppColor.textFirst,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.textFirst,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.textFirst,
        fontSize: 15,
      ),
      bodyMedium: TextStyle(color: AppColor.textFirst, fontSize: 12),
      bodySmall: TextStyle(
        color: AppColor.textFirst,
        fontSize: 11,
      ),
    ),
  );
}
