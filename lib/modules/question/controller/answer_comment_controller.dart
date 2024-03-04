import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

import '../../../utils/controllers/singleTon.dart';
import '../../../utils/helpers/fuction.dart';

class AnswerCommentController extends GetxController {
  final homeController = Get.put(HomeContoller());
  final currentPage = 0.obs;
  final onPageing = false.obs;
  final commetTexteditController = TextEditingController().obs;
  final commentText = ''.obs;
  final answerTexteditController = TextEditingController().obs;
  final answerText = ''.obs;
  final image = File('').obs;
  void getImage() async {
    File i = await pickImage();
    image.value = i;
    debugPrint("kkk${image.value}");
  }

  Future ontap(String id) async {
    if (currentPage.value == 0) {
      submmitAnswer(questionId: id);
    } else {
      submitComment(questionId: id);
    }
  }

  bool checkbutton() {
    if ((currentPage.value == 0 && answerText.value != '') ||
        (currentPage.value == 1 && commentText.value != '')) {
      return false;
    } else {
      return true;
    }
  }

  Future submmitAnswer({String? questionId}) async {
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
      url: "/v1/answer",
      methode: METHODE.post,
      isAuthorize: true,
      body: {
        "question_id": questionId,
        "description": answerText.value,
      },
    ).then((value) {
      debugPrint("done $value ");
      answerText.value = "";
      answerTexteditController.value.text = "";
      homeController.question[Singleton.obj.questionId].amountAnswers =
          homeController.question[Singleton.obj.questionId].amountAnswers! + 1;
      homeController.question.refresh();
    }).onError((error, stackTrace) {
      debugPrint("error $error");
    });
  }

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
