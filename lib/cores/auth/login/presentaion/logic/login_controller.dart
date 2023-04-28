import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/cores/auth/login/data/presentaion/login_repository.dart';

class LoginController extends LoginRepository {
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
