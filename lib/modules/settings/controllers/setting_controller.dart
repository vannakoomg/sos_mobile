import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/url.dart';
import 'package:sos_mobile/modules/settings/models/setting_models.dart';
import 'package:sos_mobile/modules/settings/modules/feedback/screen/feedback_screen.dart';
import 'package:sos_mobile/modules/settings/modules/notification/screens/setting_notification_screen.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/screen/setting_privacy_data_screen.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class SettingController extends GetxController {
  final setting = SettingModel().obs;
  final settingScreen = [
    const PrivacyDataScreen(),
    const FeedBackScreen(),
    const SettingNotificationScreen()
  ];
  final listOfPrivacy = [].obs;
  final listOfNotification = [].obs;
  final settiondata = [
    "ពត័មានផ្ទាល់ខ្លួន",
    "Theme",
    "សេចក្តីជូនដំណឹង",
    "Privacy & Data",
    "ភាសា",
    "Terms & Privacy",
    "ជំនួយ",
    "មតិកែលម្អ",
    "អំពីពួកយើង",
  ];

  final index = 0.obs;
  Future fetchSetting() async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/setting",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      debugPrint("status $value");
      setting.value = SettingModel.fromJson(value);
      listOfPrivacy.value = [
        setting.value.privateAccount,
        setting.value.showAacl,
        setting.value.showAnswer,
        setting.value.showQuestion,
      ];
      listOfNotification.value = [
        setting.value.notification,
        setting.value.notificationLike,
        setting.value.notificationComment,
        setting.value.notificationAnswer,
        setting.value.notificationCorrect,
      ];
    });
  }

  Future updateSetting(String key, int value) async {
    debugPrint(" value ===============>$key $value ");
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/setting/update",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          key: "$value",
        }).then((value) {
      debugPrint("$value");
    }).onError((error, stackTrace) {
      debugPrint("erororor $error");
    });
  }

  void resetIndex() {
    index.value = -1;
  }
}
