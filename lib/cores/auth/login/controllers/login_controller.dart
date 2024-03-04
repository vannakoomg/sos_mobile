import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import '../../../../utils/helpers/local_data/storge_local.dart';

class LoginController extends GetxController {
  final emailText = TextEditingController().obs;
  final email = ''.obs;
  final password = ''.obs;
  final passwordTextEditController = TextEditingController().obs;
  final disbleBottom = true.obs;
  final isLoading = false.obs;
  final loginSuccess = true.obs;
  Future login() async {
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
      isLoading.value = false;
    }).onError((error, stackTrace) {
      loginSuccess.value = false;
      isLoading.value = false;
      debugPrint("is facking errro$error");
    });
  }

  bool checkValidation() {
    if (checkStringIsgmail(value: email.value) == true &&
        password.value.trim().length > 5) {
      return false;
    } else {
      return true;
    }
  }
}
