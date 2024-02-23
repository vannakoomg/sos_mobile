import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';

import '../../../../../configs/theme/theme.dart';

class ThemeController extends GetxController {
  final settingController = Get.put(SettingController());
  final mode = "".obs;
  final theme = darkMode.obs;
  final isSmall = false.obs;
  void changeTheme() {
    if (settingController.setting.value.mode == "0") {
      settingController.setting.value.mode = "1";
    } else {
      settingController.setting.value.mode = "0";
    }
    settingController.update();
    debugPrint("value ${mode.value}");
    settingController
        .updateSetting(key: "mode", value: settingController.setting.value.mode)
        .then((value) {});

    if (theme.value == lightMode) {
      theme.value = darkMode;
    } else {
      theme.value = lightMode;
    }
  }
}
