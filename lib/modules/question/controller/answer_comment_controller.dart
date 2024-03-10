import 'package:get/get.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/comment_controller.dart';

class AnswerCommentController extends GetxController {
  final anwserController = Get.put(AnwserController());
  final commentController = Get.put(CommentController());
  final currentPage = 0.obs;
  final onPageing = false.obs;

  Future ontap(String id) async {
    if (currentPage.value == 0) {
      anwserController.submmitAnswer(questionId: id);
    } else {
      commentController.submitComment(questionId: id);
    }
  }

  bool checkbutton() {
    if ((currentPage.value == 0 && anwserController.answerText.value != '') ||
        (currentPage.value == 1 && commentController.commentText.value != '')) {
      return false;
    } else {
      return true;
    }
  }
}
