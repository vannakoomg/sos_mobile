import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

class EditCategoryController extends GetxController {
  final bookNameText = TextEditingController().obs;
  final oldBooKName = ''.obs;
  final oldCoverBook = ''.obs;
  final isloading = false.obs;
  final bookName = ''.obs;
  final coverBook = File('').obs;
  void getCoverBook() async {
    coverBook.value = await pickImage();
    debugPrint("ocver path ${coverBook.value.path}");
  }

  Future editCategory({String? id}) async {
    debugPrint("id $id");
    debugPrint("name ${bookName.value}");
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/save-category/update",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "id": id,
          "name": bookName.value,
        }).then(
      (value) {
        // saveCategory.value.data!
        //     .removeWhere((element) => element.id == int.parse(id!));
        // saveCategory.refresh();
      },
    ).onError((error, stackTrace) {
      debugPrint("on catch borther ");
    });
  }
}
