import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/modules/post_question/models/tag_model.dart';

class PostQuestionController extends GetxController {
  final listImage = <File>[].obs;
  var listTag = <TagModel>[].obs;
  final index = 0.obs;
  final tagTextfield = TextEditingController().obs;
  final tagtext = ''.obs;
  void getImage() async {
    final ImagePicker picker2 = ImagePicker();
    var list = await picker2.pickMultiImage();
    listImage.clear();
    for (int i = 0; i < list.length; ++i) {
      listImage.add(File(list[i].path));
    }
  }

  void onPageChanged(int x) {
    index.value = x;
  }
}
