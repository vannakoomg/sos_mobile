// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class SaveController extends GetxController {
  final isloading = false.obs;
  Future saveQuestion(String categoryId, String questionId) async {
    isloading.value = true;
    debugPrint("$categoryId , $questionId");
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/save",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "save_category_id": categoryId,
          "question_id": questionId
        }).then((value) {
      isloading.value = false;
      router.pop();
    }).onError((error, stackTrace) {
      isloading.value = false;
    });
  }
}
