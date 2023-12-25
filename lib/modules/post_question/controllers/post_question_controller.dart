import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostQuestionController extends GetxController {
  final image = File('').obs;
  final listOfTag = [].obs;
  final index = 0.obs;
  final tagtext = ''.obs;
  final titleTextEditController = TextEditingController().obs;
  final descriptionTextController = TextEditingController().obs;
  final tagTextController = TextEditingController().obs;

  void getImageGallery() async {
    final ImagePicker picker2 = ImagePicker();
    var photo = await picker2.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      image.value = File(photo.path);
    }
  }

  void getImageCamera() async {
    final ImagePicker picker2 = ImagePicker();
    var photo = await picker2.pickImage(source: ImageSource.camera);
    if (photo != null) {
      image.value = File(photo.path);
    }
  }

  bool validationPost() {
    if (image.value.path != '' &&
        listOfTag.isNotEmpty &&
        titleTextEditController.value.text != '' &&
        descriptionTextController.value.text != '') {
      return false;
    } else {
      return true;
    }
  }

  void onPageChanged(int x) {
    index.value = x;
  }
}
