import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/question/screen/post_comment_answer_screen.dart';

import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class QuestionDetailController extends GetxController {
  QuestionDetailController();
  final isLoading = false.obs;
  final tabIndex = 0.obs;
  final scrollController = ScrollController().obs;
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
            });
  }

  Future deleteQuestion(String id) async {
    debugPrint("vaue iiii $id");
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/question/$id",
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then((value) {
      debugPrint("value $value");
    });
  }

  void ontapInput(BuildContext context, String questionId) async {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return PostAnwserCommentScreen(
            id: questionId,
          );
        }));
  }
}
