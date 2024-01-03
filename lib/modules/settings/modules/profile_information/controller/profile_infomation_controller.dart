import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../cores/auth/create_account/models/subject_model.dart';
import '../../../../../utils/helpers/api_base_helper/api_base_helper.dart';

class ProfileInfoController extends GetxController {
  final isLoading = false.obs;
  final profile = File('').obs;
  final profileUrl = ''.obs;
  final bio = ''.obs;
  final name = ''.obs;
  final userName = ''.obs;
  final bioText = TextEditingController().obs;
  final nameText = TextEditingController().obs;
  final userNameText = TextEditingController().obs;
  // fetch subject
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
}
