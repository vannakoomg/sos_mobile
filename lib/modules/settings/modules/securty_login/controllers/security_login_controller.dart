import 'package:get/get.dart';

import '../../../models/setting_card_model.dart';

class SecurityLoginController extends GetxController {
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
}
