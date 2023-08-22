import 'package:get/get.dart';

class QuestionDetailController extends GetxController {
  final isAnswer = true.obs;
  final isScale = false.obs;
  final line = 0.obs;
  final index = 0.obs;
  void onPageChanged(int id) {
    isAnswer.value = !isAnswer.value;
  }
}
