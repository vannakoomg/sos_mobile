import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

import '../../../../utils/helpers/local_data/storge_local.dart';
import '../models/subject_model.dart';

class CreateAccountController extends GetxController {
  final gmailtext = TextEditingController().obs;
  final nametext = TextEditingController().obs;
  final passwordtext = TextEditingController().obs;
  final gmail = ''.obs;
  final password = ''.obs;
  final name = ''.obs;
  final otp = TextEditingController().obs;
  final disable = true.obs;
  final isloading = false.obs;
  void clearValue() {
    gmailtext.value = TextEditingController();
    nametext.value = TextEditingController();
    passwordtext.value = TextEditingController();
    otp.value = TextEditingController();
    router.pop();
  }

  void checkValidation() {
    if (gmailtext.value.text == '' ||
        nametext.value.text == '' ||
        passwordtext.value.text == '' ||
        !checkStringIsgmail(value: gmailtext.value.text)) {
      disable.value = true;
    } else {
      disable.value = false;
    }
  }

  void onChanged({String value = '', required BuildContext context}) {
    if (value.length == 4) {
      clearValue();
      router.go('/hello/create-account/otp/select-subject');
    }
  }

  final numberSelect = 0.obs;
  final selectedSucject = [].obs;
  final selectSubjectSubmit = [];
  final subject = SubjectModel().obs;
  Future fetchSubject() async {
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
            url: "/v1/subject", methode: METHODE.get, isAuthorize: false)
        .then((value) {
      subject.value = SubjectModel.fromJson(value);
      for (int i = 0; i < subject.value.data!.length; ++i) {
        selectedSucject.add(-1);
      }
    });
  }

  Future createAccount() async {
    debugPrint(
        "${name.value} $selectSubjectSubmit ${password.value} ${gmail.value}");
    isloading.value = true;
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/register",
        methode: METHODE.post,
        isAuthorize: false,
        body: {
          "name": name.value,
          "user_subject": selectSubjectSubmit,
          "password": password.value,
          "email": gmail.value
        }).then((value) async {
      await LocalStorage.storeData(
              key: 'access_token', value: value['access_token'])
          .then((value) {
        isloading.value = false;
        router.go('/home');
      });
    }).onError((error, stackTrace) {
      debugPrint("onchaeafkdf");
      isloading.value = false;
    });
  }
}
