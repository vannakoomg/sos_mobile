import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColor.backgroundColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
          color: Colors.black,
          // fontFamily: 'preahvihear',
          fontSize: 14,
          fontWeight: FontWeight.w600),
      bodySmall: TextStyle(
          color: Colors.white,
          fontFamily: 'preahvihear',
          fontSize: 10,
          fontWeight: FontWeight.w500),
    ),
  );
}
