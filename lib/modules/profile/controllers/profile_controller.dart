import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/modules/profile/models/profile_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class ProfileController extends GetxController {
  var imagePath = File('').obs;
  var listImage = <File>[].obs;
  final page = 0.obs;
  final isScroll = false.obs;
  final isAnswer = true.obs;
  final profileDate = ProfileModel().obs;
  final isloadingProfile = true.obs;

  void getProfile() async {
    isloadingProfile.value = true;
    try {
      await ApiBaseHelper.apiBaseHelper
          .onNetworkRequesting(
        url: "/v1/user/profile",
        methode: METHODE.get,
        isAuthorize: true,
      )
          .then((value) {
        profileDate.value = ProfileModel.fromJson(value);
        isloadingProfile.value = false;
        debugPrint("data ${profileDate.value.data!.questions![0].description}");
      }).onError((error, stackTrace) {
        debugPrint("on error ");
      });
    } catch (e) {
      debugPrint("on catch ");
    }
  }

  void pickImageProfile() async {
    final ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = File(image.path);
    }
  }
}
