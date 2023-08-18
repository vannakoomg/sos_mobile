import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/Model/home_model.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';

import '../../../configs/url.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class HomeContoller extends GetxController {
  final controller = Get.put(AppController());
  final homeData = HomeModel().obs;
  final scrollPixel = 0.0.obs;
  final oldScrollPixel = 0.0.obs;
  final oldScrollback = 0.0.obs;
  final scrollPixalBack = 0.0.obs;
  var isLoading = true.obs;
  final isForYou = true.obs;
  final isMovePage = true.obs;

  Future fetchQuestion() async {
    isLoading.value = true;
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
          url: "$baseUrl/v1/question/all",
          methode: METHODE.get,
          isAuthorize: true,
        )
        .onError((error, stackTrace) => {debugPrint("data")})
        .then((value) => {
              isLoading.value = false,
              homeData.value = HomeModel.fromJson(value),
              debugPrint("value $value"),
              debugPrint("data response ${homeData.value.data!.length}"),
            });
  }
}
