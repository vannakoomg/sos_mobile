import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.mainColor,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
    primaryColor: AppColor.backgroundColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 15),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 13),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 11,
      ),
    ),
  );
}
