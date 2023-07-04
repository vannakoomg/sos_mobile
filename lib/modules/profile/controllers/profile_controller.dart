import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/url.dart';
import 'package:sos_mobile/modules/profile/models/profile_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class ProfileController extends GetxController {
  var imagePath = File('').obs;
  var listImage = <File>[].obs;
  final page = 0.obs;
  final isScroll = false.obs;
  final isAnswer = true.obs;
  final profileDate = ProfileModel().obs;
  void setdefultvalue() {
    isAnswer.value = true;
    isScroll.value = false;
    page.value = 0;
  }

  void getProfile() async {
    var data = await ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
      url: "$baseUrl/v1/user/profile",
      methode: METHODE.get,
      isAuthorize: true,
    );
    profileDate.value = ProfileModel.fromJson(data);
    debugPrint(
        "data ${profileDate.value.data!.questions![0].description.toString()}");
  }
}
