import 'dart:io';

import 'package:get/get.dart';

class ProfileController extends GetxController {
  var imagePath = File('').obs;
  var listImage = <File>[].obs;
  final page = 0.obs;
  final isScroll = false.obs;
  final isAnswer = true.obs;
  void setdefultvalue() {
    isAnswer.value = true;
    isScroll.value = false;
    page.value = 0;
  }
}
