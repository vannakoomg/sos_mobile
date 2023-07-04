import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import '../../../../utils/helpers/local_data/storge_local.dart';

class LoginController extends GetxController {
  final phoneTextEditController = TextEditingController().obs;
  final passwordTextEditController = TextEditingController().obs;
  final disbleBottom = true.obs;
  Future login() async {
    String url = 'http://10.0.2.2:8001/api/login';
    debugPrint("url $url ");
    try {
      await ApiBaseHelper.apiBaseHelper.post(url, {
        "phone": "+85577777777",
        "password": "12345678",
      }, headers: {
        "Accept": "application/json"
      }).then((value) async {
        await LocalStorage.storeData(
            key: 'access_token', value: value.body["access_token"]);
        Get.toNamed('dasborad');
      });
    } catch (value) {
      debugPrint("you have been catch $value");
    }
  }

  void checkValidation() {
    if (phoneTextEditController.value.text != '' &&
        passwordTextEditController.value.text != '') {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }
}
