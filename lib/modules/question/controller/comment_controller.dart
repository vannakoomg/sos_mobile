import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/question/models/comment_in_question.dart';

import '../../../utils/controllers/singleTon.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';
import '../widgets/more_comment_option.dart';

class CommentController extends GetxController {
  final isloading = false.obs;
  final homeController = Get.put(HomeContoller());
  final commetTexteditController = TextEditingController().obs;
  final commentText = ''.obs;
  final comentInQuestionModel = CommentInQuestionModel().obs;
  final commentInQuestion = <CommentInQuestion>[].obs;
  final currentPage = 1.obs;
  final nextPage = 0.obs;
  final isScroller = false.obs;
  final offset = 0.0.obs;

  final scrollController = ScrollController().obs;
  void fetchCommentInQuestionNextPage(String id) {
    if (isloading.value == false) {
      if (nextPage < comentInQuestionModel.value.meta!.lastPage!) {
        nextPage.value = currentPage.value + 1;
        fetchCommentInQuestion(id, nextPage.value).then((value) {
          currentPage.value = nextPage.value;
        });
      }
    }
  }

  Future fetchCommentInQuestion(String id, int page) async {
    debugPrint("fetching answer in question $id");
    isloading.value = true;
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/comment/all?question_id=$id&page=",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      isloading.value = false;
      comentInQuestionModel.value = CommentInQuestionModel.fromJson(value);
      commentInQuestion.addAll(comentInQuestionModel.value.data!);
    }).onError((error, stackTrace) {
      isloading.value = false;
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
