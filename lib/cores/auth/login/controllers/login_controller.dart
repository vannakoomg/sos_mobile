import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import '../../../../configs/url.dart';
import '../../../../utils/helpers/local_data/storge_local.dart';

class LoginController extends GetxController {
  final emailText = TextEditingController().obs;
  final passwordTextEditController = TextEditingController().obs;
  final disbleBottom = true.obs;
  final isLoading = false.obs;
  final loginSuccess = true.obs;
  Future login() async {
    loginSuccess.value = true;
    isLoading.value = true;
    await ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: '/login',
        methode: METHODE.post,
        isAuthorize: false,
        body: {
          "phone": "+85566665555",
          "password": "77777777",
        }).then((value) async {
      debugPrint("data respose ${value["access_token"]}");
      await LocalStorage.storeData(
          key: 'access_token', value: value["access_token"]);
      loginSuccess.value = true;
    }).onError((error, stackTrace) {
      debugPrint("is facking errro$error");
    });
  }

  void checkValidation() {
    if (checkStringIsgmail(value: emailText.value.text) == true &&
        passwordTextEditController.value.text.trim().length > 5) {
      disbleBottom.value = false;
    } else {
      disbleBottom.value = true;
    }
  }
}
