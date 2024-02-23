import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/post_question/models/tag_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class PostQuestionController extends GetxController {
  final homeController = Get.put(HomeContoller());
  final isDisble = true.obs;
  final isloading = false.obs;
  final image = File('').obs;
  final selectTags = <Tags>[].obs;
  final index = 0.obs;
  final tagtext = ''.obs;
  final title = ''.obs;

  final description = ''.obs;
  final titleTextEditController = TextEditingController().obs;
  final descriptionTextController = TextEditingController().obs;
  final tagTextController = TextEditingController().obs;
  final tagsData = TagsModel().obs;
  final isFocus = false.obs;
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
    if ((selectTags.isNotEmpty &&
            title.value != '' &&
            image.value.path != "") ||
        (selectTags.isNotEmpty &&
            title.value != '' &&
            description.value != "")) {
      return false;
    } else {
      return true;
    }
  }

  Future fetchTag(String name) async {
    listSelect.clear();
    for (int i = 0; i < selectTags.length; ++i) {
      listSelect.add(selectTags[i].id);
    }
    if (name != '') {
      ApiBaseHelper.apiBaseHelper
          .onNetworkRequesting(
        url: "/v1/tags/search",
        body: {"name": name, "oldList": listSelect},
        methode: METHODE.get,
        isAuthorize: false,
      )
          .then((value) {
        debugPrint("value $value");
        tagsData.value = TagsModel.fromJson(value);
      }).onError(
        (error, stackTrace) {},
      );
    }
  }

  Future createTag(String name) async {
    debugPrint("niii");
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/tags",
      methode: METHODE.post,
      body: {
        "name": name,
      },
      isAuthorize: false,
    )
        .then((value) {
      onSelectTag(Tags(
        id: value["data"]["id"],
        name: value["data"]["name"],
      ));
    }).onError((error, stackTrace) {
      debugPrint("tag on errrororoor");
    });
  }

  final listSelect = [];

  Future postQuestion() async {
    isloading.value = true;
    homeController.isShowBottonNavigettion.value = false;
    listSelect.clear();
    for (int i = 0; i < selectTags.length; ++i) {
      listSelect.add(selectTags[i].id);
    }
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/question",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "title": title.value,
          "description": description.value,
          "tags": listSelect,
          "image": "example image"
        }).then(
      (value) {
        debugPrint("your question $value");
        listSelect.clear();
        selectTags.clear();
        title.value = "";
        description.value = "";
        titleTextEditController.value = TextEditingController();
        descriptionTextController.value = TextEditingController();
        image.value = File("");
        isloading.value = false;
        isDisble.value = true;
        homeController.isShowBottonNavigettion.value = true;
      },
    ).onError((error, stackTrace) {
      isloading.value = false;
      homeController.isShowBottonNavigettion.value = true;
    });
  }

  Future updateQuestion(int id) async {
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/question/$id",
        methode: METHODE.put,
        isAuthorize: true,
        body: {
          "title": title.value,
          "description": description.value,
          // "tags": listSelect,
          "image": "example image"
        }).then(
      (value) {
        debugPrint("your question $value");
      },
    );
  }

  Future deleteQuestion(int id) async {
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/question/$id",
      methode: METHODE.delete,
      isAuthorize: true,
    )
        .then(
      (value) {
        debugPrint("your question $value");
      },
    );
  }
}
