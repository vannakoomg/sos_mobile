import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';

import '../../../utils/controllers/singleTon.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class CommentController extends GetxController {
  final homeController = Get.put(HomeContoller());
  final commetTexteditController = TextEditingController().obs;
  final commentText = ''.obs;
  Future submitComment({String? questionId}) async {
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
      url: "/v1/comment",
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        "question_id": questionId,
        "message": commentText.value,
      },
    ).then((value) {
      commentText.value = '';
      commetTexteditController.value.text = "";
      homeController.question[Singleton.obj.questionId].amountComments =
          homeController.question[Singleton.obj.questionId].amountComments! + 1;
      homeController.question.refresh();
    });
  }
}
