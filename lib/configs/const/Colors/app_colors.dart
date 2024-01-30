import 'package:flutter/material.dart';

extension AppColor on Color {
  // for widget
  static var primaryColor = Colors.white;
  static var secondnaryColor = const Color.fromARGB(255, 219, 22, 81);
  // static var backgroundColor = const Color.fromARGB(255, 251, 251, 251);
  static var mainColor = Colors.black;

  //for font
  static var textFirst = const Color.fromARGB(255, 8, 8, 8);
  static var textSec = const Color(0xffe9ecef);
  static var textThird = const Color.fromARGB(255, 142, 142, 142);
  static var textfourth = const Color.fromARGB(255, 85, 84, 84);

  // for button
  static var buttonColor = const Color.fromARGB(255, 219, 22, 81);
  static var warningColor = const Color(0xffAAA505);
  static var dangerColor = const Color(0xff991A2A);
  static var successColor = const Color.fromARGB(255, 46, 137, 61);
}
