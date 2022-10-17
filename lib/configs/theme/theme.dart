import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: AppColor.backgroundColor,
    // appBarTheme: AppBarTheme(),
    backgroundColor: AppColor.backgroundColor,
    textTheme: TextTheme(
      // for [title , profile]
      headline1: TextStyle(
        color: AppColor.textColor,
        fontSize: 28,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
      headline2: TextStyle(
        color: AppColor.textColor,
        fontSize: 24,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
      headline3: TextStyle(
        color: AppColor.textColor,
        fontSize: 20,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
        color: AppColor.textColor,
        fontSize: 14,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
      headline5: TextStyle(
        color: AppColor.textColor,
        fontSize: 12,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
      button: TextStyle(
        color: AppColor.textColor,
        fontSize: 28,
        fontFamily: 'siemreap',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
