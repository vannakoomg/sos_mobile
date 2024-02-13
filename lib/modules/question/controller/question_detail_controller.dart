import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import 'package:sos_mobile/modules/question/widgets/comment_option.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

import '../../../utils/helpers/api_base_helper/api_base_helper.dart';
import '../../report/screens/report_type_screen.dart';

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
    if (jumpAll.value == true) {
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
    } else {
      scrollerController01
          .animateTo(hightOfBar.value,
              curve: Curves.ease, duration: const Duration(milliseconds: 500))
          .then((value) {
        jumpAll.value = true;
      });
      // scrollerController02.animateTo(0,
      //     curve: Curves.ease, duration: const Duration(milliseconds: 700));
      // scrollerController03
      //     .animateTo(0,
      //         curve: Curves.ease, duration: const Duration(milliseconds: 700))
      //     .then((value) => {
      // });
    }
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
        scrollerController01
            .animateTo(0,
                curve: Curves.ease, duration: const Duration(milliseconds: 500))
            .then((value) {
          isScroll.value = false;
        });
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

  void ontapMoreComment(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return const CommentOption();
        }));
  }

  void ontapMoreQuestion(BuildContext context) async {
    isScale.value = !isScale.value;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              height: 240,
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 10),
              decoration: BoxDecoration(
                color: AppColor.textfourth,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "Option",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColor.textThird, fontSize: 18),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Hide",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Download Photo",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: false,
                              builder: ((context) {
                                return const ReportTypeScreen();
                              }));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5, top: 5),
                          width: double.infinity,
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("Report",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!),
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 20,
                                color: AppColor.textThird,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButtom(
                  height: 40,
                  title: "Close",
                  onTap: () {
                    context.pop();
                  },
                )
              ]),
            ),
          ));
        }));
  }

  void ontapInput(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return const CommentScreen();
        }));
  }
}
