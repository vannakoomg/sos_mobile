import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class QuestionDetailController extends GetxController {
  QuestionDetailController();
  final pageController = PageController();
  GlobalKey globalKey = GlobalKey();
  final scrollerController01 = ScrollController();
  final scrollerController02 = ScrollController();
  final scrollerController03 = ScrollController();
  final hightOfBar = 0.0.obs;
  final isScroll = false.obs;
  final isAnswer = true.obs;
  final isScale = false.obs;
  final isLoading = false.obs;
  final jumpAll = false.obs;

  void doubleTapScreen() {
    jumpAll.value = true;
    scrollerController01.animateTo(0,
        curve: Curves.ease, duration: const Duration(milliseconds: 500));
    scrollerController02.animateTo(0,
        curve: Curves.ease, duration: const Duration(milliseconds: 700));
    scrollerController03
        .animateTo(0,
            curve: Curves.ease, duration: const Duration(milliseconds: 700))
        .then((value) => {
              jumpAll.value = false,
            });
  }

  void listenScoller() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hightOfBar.value = globalKey.currentContext!.size!.height;
    });
    scrollerController01.addListener(() {
      if (scrollerController01.offset >=
          globalKey.currentContext!.size!.height) {
        isScroll.value = true;
        scrollerController02.animateTo(1,
            curve: Curves.ease, duration: const Duration(milliseconds: 100));
        scrollerController03.animateTo(1,
            curve: Curves.ease, duration: const Duration(milliseconds: 100));
        scrollerController01
            .animateTo(hightOfBar.value,
                curve: Curves.ease, duration: const Duration(milliseconds: 100))
            .then((value) {});
      } else {
        isScroll.value = false;
      }
    });
    scrollerController02.addListener(() {
      if (scrollerController02.offset == 0) {
        isScroll.value = false;
        scrollerController01.animateTo(0,
            curve: Curves.ease, duration: const Duration(milliseconds: 500));
        scrollerController03.jumpTo(0);
      } else {
        isScroll.value = true;
      }
    });
    scrollerController03.addListener(() {
      if (scrollerController03.offset == 0) {
        isScroll.value = false;
        scrollerController01.animateTo(0,
            curve: Curves.ease, duration: const Duration(milliseconds: 500));
        scrollerController02.jumpTo(0);
      } else {
        isScroll.value = true;
      }
    });
  }

  void onPageChanged() {
    isAnswer.value = !isAnswer.value;
  }

  void ontapChange() {
    if (isAnswer.value) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
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

  final showConmment = false.obs;
}
