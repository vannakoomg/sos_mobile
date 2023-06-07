import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneTextEditController = TextEditingController().obs;
  final passwordTextEditController = TextEditingController().obs;
  final disbleBottom = true.obs;
  void checkValidation() {
    if (phoneTextEditController.value.text != '' &&
        passwordTextEditController.value.text != '') {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }
}
