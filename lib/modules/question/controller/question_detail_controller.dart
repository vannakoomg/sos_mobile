import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/url.dart';

import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class QuestionDetailController extends GetxController {
  final isAnswer = true.obs;
  final isScale = false.obs;
  final line = 0.obs;
  final index = 0.obs;
  final isLoading = false.obs;
  void onPageChanged(int id) {
    isAnswer.value = !isAnswer.value;
  }

  void fetchQuestionDetail({required int id}) async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
          url: "/v1/question/all",
          methode: METHODE.get,
          isAuthorize: true,
        )
        .onError((error, stackTrace) => {
              debugPrint("data"),
            })
        .then((value) => {
              isLoading.value = false,
              // homeData.value = HomeModel.fromJson(value),
              // debugPrint("value ${homeData.value.data!.length}"),
            });
  }
}
