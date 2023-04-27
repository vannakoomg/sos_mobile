import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/cores/auth/signup/data/repository/signup_repostitory.dart';

import '../../../../../utils/helpers/fuction.dart';

class SignUpController extends SignupRepository {
  final steps = 0.obs;
  final disbleBottom = true.obs;
  final gmailTextEditController = TextEditingController().obs;
  final nameTextEditController = TextEditingController().obs;
  final passwordTextEditController = TextEditingController().obs;

  String stepsString() {
    switch (steps.value) {
      case 0:
        return "what is you gmail";
      case 1:
        return "what is your name";
      case 2:
        return "what is your password";
      default:
        return "chose your avata";
    }
  }

  void onChangedGmail() {
    if (checkStringIsgmail(value: gmailTextEditController.value.text) == true) {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }

  void onChangedName() {
    if (nameTextEditController.value.text != '') {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }

  void onChangePassword() {
    if (passwordTextEditController.value.text.length >= 6) {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }

  void onTapBottomNext() {
    disbleBottom.value = true;
    steps.value++;
  }
}
