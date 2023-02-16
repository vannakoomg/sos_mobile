import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: AppColor.backgroundColor,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: 'preahvihear',
          fontSize: 26,
          fontWeight: FontWeight.w500),
    ),
  );
}
