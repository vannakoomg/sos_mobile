import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/setting_card_model.dart';

class SecurityLoginController extends GetxController {
  final gmailText = TextEditingController().obs;
  final gmail = ''.obs;
  final otp = ''.obs;
  final otpText = TextEditingController().obs;
  final securityLoginData = <SettingCardModel>[
    SettingCardModel(
      description: 'when you login is require Otp',
      subtitle: "On",
      title: "Two Factor Login",
      columName: "two_factor",
    ),
    SettingCardModel(
      description: 'when you login is require Otp',
      subtitle: "On",
      title: "Two Factor Login",
      columName: "two_factor",
    ),
  ];
  final indexChangeGmail = 0.obs;
}
