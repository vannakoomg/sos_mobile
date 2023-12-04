import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/Model/home_model.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';

import '../../../configs/url.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class HomeContoller extends GetxController {
  final controller = Get.put(AppController());
  final questionData = QuestionModelData().obs;
  final question = <QuestionModel>[].obs;
  final scrollPixel = 0.0.obs;
  final oldScrollPixel = 0.0.obs;
  final oldScrollback = 0.0.obs;
  final scrollPixalBack = 0.0.obs;
  final isLoading = true.obs;
  final isForYou = true.obs;
  final isMovePage = true.obs;
  final isFocus = false.obs;
  final searchText = ''.obs;
  final pageController = PageController();
  final scrollController = ScrollController().obs;
  final fetchData = true.obs;
  final currentPage = 1.obs;
  final nextPage = 0.obs;
  void onPageChanged() {
    if (isForYou.value) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    } else {
      pageController.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  void listionScrollNavitionbar() {
    scrollPixel.value = scrollController.value.offset;
    if (oldScrollPixel.value > scrollPixel.value) {
      scrollPixalBack.value = oldScrollPixel.value - scrollPixel.value;
      if (scrollPixalBack.value > oldScrollback.value) {
        oldScrollback.value = scrollPixalBack.value;
      } else {
        oldScrollPixel.value = scrollPixel.value;
      }
    } else {
      scrollPixalBack.value = 0;
      oldScrollback.value = 0;
      oldScrollPixel.value = scrollPixel.value;
    }
  }

  void fetchQuestionNextPage() {
    if (nextPage < questionData.value.meta!.lastPage!) {
      if (scrollController.value.offset ==
          scrollController.value.position.maxScrollExtent) {
        nextPage.value = currentPage.value + 1;
        fetchQuestion(nextPage.value).then((value) {
          currentPage.value = nextPage.value;
        });
      }
    }
  }

  Future fetchQuestion(int page) async {
    isLoading.value = true;
    isForYou.value = true;
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
          url: "$baseUrl/v1/question?page=$page",
          methode: METHODE.get,
          isAuthorize: true,
        )
        .onError((error, stackTrace) => {
              debugPrint("data"),
            })
        .then((value) => {
              isLoading.value = false,
              questionData.value = QuestionModelData.fromJson(value),
              debugPrint("value ${questionData.value.meta!.lastPage}"),
              for (int i = 0; i < value['data'].length; ++i)
                {
                  question.add(QuestionModel.fromJson(value['data'][i])),
                },
            });
    fetchData.value = false;
  }
}
