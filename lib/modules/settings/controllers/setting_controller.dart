import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/models/setting_models.dart';
import 'package:sos_mobile/modules/settings/models/setting_router_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';

class SettingController extends GetxController {
  SettingController() {
    getTheme();
  }
  final mode = ''.obs;
  Future getTheme() async {
    mode.value = await LocalStorage.getStringValue(key: 'mode');
    debugPrint(mode.value);
  }

  final setting = SettingModel().obs;
  final listOfPrivacy = [].obs;
  final listOfNotification = [].obs;
  final settiondata = [
    SettingRouterModel(
      router: 'profile-info',
      title: 'ពត័មានផ្ទាល់ខ្លួន',
    ),
    SettingRouterModel(
      router: 'theme',
      title: 'Theme',
    ),
    SettingRouterModel(
      router: 'setting-notification',
      title: 'សេចក្តីជូនដំណឹង',
    ),
    SettingRouterModel(
      router: 'setting-privacy',
      title: 'Privacy & Data',
    ),
    SettingRouterModel(
      router: 'security-login',
      title: 'Security & Login',
    ),
    SettingRouterModel(
      router: '/home/setting/',
      title: 'ភាសា',
    ),
    SettingRouterModel(
      router: '/home/setting/',
      title: 'Terms & Privacy',
    ),
    SettingRouterModel(
      router: '/home/setting/',
      title: 'ជំនួយ',
    ),
    SettingRouterModel(
      router: '/hom/setting/',
      title: 'មតិកែលម្អ',
    ),
    SettingRouterModel(
      router: 'feedback',
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

  Future updateSetting({String? key, var value}) async {
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/setting/update",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "key": key,
          "value": value,
        }).then((value) {
      debugPrint("update setting ");
    }).onError((error, stackTrace) {
      debugPrint("update setting 500 $error");
    });
  }

  void resetIndex() {
    index.value = -1;
  }
}
