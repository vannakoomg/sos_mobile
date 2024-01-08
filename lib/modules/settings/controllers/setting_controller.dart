import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/models/setting_models.dart';
import 'package:sos_mobile/modules/settings/models/setting_router_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class SettingController extends GetxController {
  final setting = SettingModel().obs;
  final listOfPrivacy = [].obs;
  final listOfNotification = [].obs;
  final settiondata = [
    SettingRouterModel(
      router: '/home-screen/setting/profile-info',
      title: 'ពត័មានផ្ទាល់ខ្លួន',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/',
      title: 'Theme',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/setting-notification',
      title: 'សេចក្តីជូនដំណឹង',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/setting-privacy',
      title: 'Privacy & Data',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/security-login',
      title: 'Security & Login',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/',
      title: 'ភាសា',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/',
      title: 'Terms & Privacy',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/',
      title: 'ជំនួយ',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/',
      title: 'មតិកែលម្អ',
    ),
    SettingRouterModel(
      router: '/home-screen/setting/feedback',
      title: 'មតិកែលម្អ',
    ),
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
