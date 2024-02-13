import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

ThemeData lightMode = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColor.secondnaryColor.withOpacity(0.6),
  ),
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 238, 238, 238),
    primary: Colors.black,
    secondary: Colors.white,
    tertiary: Color.fromARGB(255, 27, 27, 27),

    ///--------------
    onPrimary: Color.fromARGB(255, 67, 67, 67),
    onSecondary: Color.fromARGB(255, 133, 133, 133),
    onTertiary: Color.fromARGB(255, 49, 49, 49),
  ),
  useMaterial3: true,
  brightness: Brightness.light,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: AppColor.textFirst,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Siemreap",
    ),
    titleMedium: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: "Siemreap",
    ),
    titleSmall: TextStyle(
      color: AppColor.textFirst,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Siemreap",
    ),
    bodyLarge: TextStyle(
      color: AppColor.textFirst,
      fontSize: 15,
      fontFamily: "Siemreap",
    ),
    bodyMedium: TextStyle(
      color: AppColor.textFirst,
      fontSize: 12,
      fontFamily: "Siemreap",
    ),
    bodySmall: TextStyle(
      color: AppColor.textFirst,
      fontSize: 11,
      fontFamily: "Siemreap",
    ),
  ),
);
ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    background: Colors.black,
    primary: Colors.white,
    secondary: Color.fromARGB(255, 77, 77, 77),
    tertiary: Color.fromARGB(255, 207, 207, 207),
    onPrimary: Color.fromARGB(255, 198, 198, 198),
    onSecondary: Color.fromARGB(255, 111, 111, 111),
    onTertiary: Color.fromARGB(255, 51, 51, 51),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColor.secondnaryColor.withOpacity(0.6),
  ),
  useMaterial3: true,
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Siemreap",
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Siemreap",
    ),
    titleSmall: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "Siemreap",
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontFamily: "Siemreap",
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontFamily: "Siemreap",
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 11,
      fontFamily: "Siemreap",
    ),
  ),
);
