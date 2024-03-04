import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

import '../../../../../cores/auth/create_account/models/subject_model.dart';
import '../../../../../utils/helpers/api_base_helper/api_base_helper.dart';

class ProfileInfoController extends GetxController {
  final profileController = Get.put(OwnProfileController());
  final isLoading = false.obs;
  final profile = File('').obs;
  final profileUrl = ''.obs;
  final bio = ''.obs;
  final name = ''.obs;
  final userName = ''.obs;
  final bioText = TextEditingController().obs;
  final nameText = TextEditingController().obs;
  final userNameText = TextEditingController().obs;
  final selectedSucject = [].obs;
  final selectSubjectSubmit = [];
  final color = [];
  final subject = SubjectModel().obs;
  Future fetchSubject() async {
    isLoading.value = true;
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
            url: "/v1/subject", methode: METHODE.get, isAuthorize: false)
        .then((value) {
      isLoading.value = false;
      subject.value = SubjectModel.fromJson(value);
      for (int i = 0; i < subject.value.data!.length; ++i) {
        selectedSucject.add(-1);
        color.add(rendomColors());
      }
    });
  }

  Future fetchProfile() async {
    // ApiBaseHelper.apiBaseHelper.onNetworkRequesting(url: url, methode: methode, isAuthorize: isAuthorize)
  }
}
