import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';

import '../../../utils/controllers/singleTon.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';
import '../../../utils/helpers/fuction.dart';
import '../models/anwser_in_question.dart';

class AnwserController extends GetxController {
  // fetch anwser in question
  final homeController = Get.put(HomeContoller());
  final answerTexteditController = TextEditingController().obs;
  final answerText = ''.obs;
  final isloaing = false.obs;
  final currentPage = 1.obs;
  final nextPage = 0.obs;
  final image = File('').obs;
  void getImage() async {
    File i = await pickImage();
    image.value = i;
  }

  final anwserInQuestionModel = AnwserInQuestionModel().obs;
  final anwserInQuestion = <AnwserInQuestion>[].obs;
  Future fetchAnwserInQuestion(String id) async {
    debugPrint("fetching answer in question $id");
    anwserInQuestion.clear();
    isloaing.value = true;
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/answer/all?question_id=$id",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      isloaing.value = false;
      anwserInQuestionModel.value = AnwserInQuestionModel.fromJson(value);
      anwserInQuestion.addAll(anwserInQuestionModel.value.data!);
      debugPrint("data55555555 ${anwserInQuestion.length}");
    }).onError((error, stackTrace) {
      isloaing.value = false;
    });
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
      anwserInQuestion.insert(
        0,
        AnwserInQuestion(
          amountComments: 0,
          createdAt: "Now",
          description: answerText.value,
          isCorrect: 0,
          image: "",
          isReport: 0,
        ),
      );
      answerText.value = "";
      answerTexteditController.value.text = "";
      homeController.question[Singleton.obj.questionId].amountAnswers =
          homeController.question[Singleton.obj.questionId].amountAnswers! + 1;
      homeController.question.refresh();
      anwserInQuestion.refresh();
    }).onError((error, stackTrace) {
      debugPrint("error $error");
    });
  }
}
