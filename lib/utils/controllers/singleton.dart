// ignore_for_file: file_names

import 'package:get/get.dart';

class Singleton extends GetxController {
  static Singleton? _obj;
  Singleton._();
  static Singleton get obj => _obj ??= Singleton._();
  int questionId = 0;
  final numberNotification = 0.obs;
}
