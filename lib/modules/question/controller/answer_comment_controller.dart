import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/fuction.dart';

class AnswerCommentController extends GetxController {
  final isPost = false.obs;
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
}
