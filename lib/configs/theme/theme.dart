import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColor.secondnaryColor.withOpacity(0.6),
      selectionHandleColor: const Color(0xff64b5f6),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.mainColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColor.textColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    primaryColor: AppColor.textColor,
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: AppColor.textColor, fontSize: 25, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
        color: AppColor.textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColor.textColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColor.textColor,
        fontSize: 15,
      ),
      bodyMedium: TextStyle(color: AppColor.textColor, fontSize: 13),
      bodySmall: TextStyle(
        color: AppColor.textColor,
        fontSize: 11,
      ),
    ),
  );
}
