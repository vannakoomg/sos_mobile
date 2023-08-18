import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';

class FeedBackController extends GetxController {
  final controller = Get.put(SettingController());

  void resetIndex() {
    controller.index.value = 0;
  }

  final descriptionTextController = TextEditingController().obs;
  final description = ''.obs;
  void submit() {}
}
