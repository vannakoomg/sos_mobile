import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigatonBarController extends GetxController {
  final index = 0.obs;
  final icon = [
    Icons.home_filled,
    Icons.save_alt,
    Icons.question_mark_rounded,
    Icons.notifications,
    Icons.person
  ];
}
