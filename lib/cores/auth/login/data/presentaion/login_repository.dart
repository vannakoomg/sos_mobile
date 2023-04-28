import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentaion/logic/login_controller.dart';

final controller = Get.put(LoginController());

class LoginRepository extends GetxController {
  void login() {
    debugPrint(
        "ksk sl khmer  ${controller.phoneTextEditController.value.text}");
  }
}
