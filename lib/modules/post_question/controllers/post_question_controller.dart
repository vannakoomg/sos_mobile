import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/modules/post_question/models/tag_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class PostQuestionController extends GetxController {
  final image = File('').obs;
  final selectTags = <Tags>[].obs;
  final index = 0.obs;
  final tagtext = ''.obs;
  final titleTextEditController = TextEditingController().obs;
  final descriptionTextController = TextEditingController().obs;
  final tagTextController = TextEditingController().obs;
  final tagsData = TagsModel().obs;
  void onSelectTag(Tags tage) {
    tagtext.value = '';
    tagTextController.value.text = '';
    selectTags.add(tage);
  }

  void removeTag(int index) {
    selectTags.removeAt(index);
    if (selectTags.isEmpty) {
      tagtext.value = '';
      tagTextController.value = TextEditingController();
    }
  }

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
        selectTags.isNotEmpty &&
        titleTextEditController.value.text != '' &&
        descriptionTextController.value.text != '') {
      return false;
    } else {
      return true;
    }
  }

  Future fetchTag(String name) async {
    tagsData.value = TagsModel();
    if (name != '') {
      ApiBaseHelper.apiBaseHelper
          .onNetworkRequesting(
        url: "/v1/tags/search?name=$name",
        methode: METHODE.get,
        isAuthorize: false,
      )
          .then((value) {
        tagsData.value = TagsModel.fromJson(value);
        debugPrint("value ${tagsData.value.tags!.length}");
      }).onError(
        (error, stackTrace) {},
      );
    }
  }

  final listSelect = [];

  Future postQuestion() async {
    listSelect.clear();
    for (int i = 0; i < selectTags.length; ++i) {
      listSelect.add(selectTags[i].id);
    }
    debugPrint("select list $listSelect");
  }
}
