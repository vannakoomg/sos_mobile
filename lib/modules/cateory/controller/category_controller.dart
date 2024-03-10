import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/cateory/controller/kkkkk.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_comfirm_yes_no.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../configs/route/route.dart';
import '../models/save_category_model.dart';

class CategoryController extends GetxController {
  final title = ''.obs;
  final index = 0.obs;
  final bookNameText = TextEditingController().obs;
  final saveCategory = SaveCategoryModel().obs;
  final isloading = false.obs;
  final bookName = ''.obs;
  final coverBook = File('').obs;
  Future getCoverBook() async {
    coverBook.value = await pickImage();
    debugPrint("ocver path ${coverBook.value.path}");
  }

  Future fetchSaveCategory() async {
    isloading.value = true;
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/save-category",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then(
      (value) {
        saveCategory.value = SaveCategoryModel.fromJson(value);
        isloading.value = false;
      },
    ).onError((error, stackTrace) {
      isloading.value = false;
    });
  }

  Future createSaveCategory(BuildContext context) async {
    unFocus(context);
    if (saveCategory.value.data!
        .any((element) => element.name == bookName.value)) {
      showTopSnackBar(
        padding: const EdgeInsets.only(left: 20, right: 20),
        animationDuration: const Duration(milliseconds: 500),
        Overlay.of(context),
        CustomSnackBar.success(
          icon: Container(
            width: 3000,
            height: 60,
            color: Colors.green,
            child: const Text("sdafsadhfksadhfkadshf;k"),
          ),
          borderRadius: BorderRadius.circular(300),
          message: 'sdafas',
        ),
      );
    } else {
      isloading.value = true;
      createCategory(
        file: coverBook.value,
        name: bookName.value,
      ).then((value) {
        bookName.value = '';
        bookNameText.value = TextEditingController();
        router.pop();
        router.pop();
        isloading.value = false;
      }).onError((error, stackTrace) {
        debugPrint("sdfds");
        isloading.value = false;
      });
    }
  }

  Future mergeSaveCategory(
      {String? fromId, String? toId, BuildContext? context}) async {
    showModalBottomSheet(
        context: context!,
        isScrollControlled: false,
        builder: ((context) {
          return CustomComfirmYesNo(
            title: "Do Went To Meger The Book ?",
            subTitle:
                "Meger book mean that question in book 1 with cute to book 2",
            ontapYes: () {
              isloading.value = true;
              ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
                  url: "/v1/save-category/merge",
                  methode: METHODE.post,
                  isAuthorize: true,
                  body: {
                    "from": fromId,
                    "to": toId,
                  }).then(
                (value) {
                  debugPrint("done =================>");
                  isloading.value = false;
                  router.pop();
                  Future.delayed(const Duration(milliseconds: 200), () {
                    router.pop();
                    Future.delayed(const Duration(milliseconds: 200), () {
                      router.pop();
                    });
                  });
                },
              ).onError((error, stackTrace) {
                debugPrint("on catch =================>");
                isloading.value = false;
              });
            },
          );
        }));
  }

  Future deleteSaveCategory({String? id}) async {
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/save-category/delete",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "id": id,
        }).then(
      (value) {
        router.pop();
        router.pop();
        saveCategory.value.data!
            .removeWhere((element) => element.id == int.parse(id!));
        saveCategory.refresh();
      },
    ).onError((error, stackTrace) {
      debugPrint("on catch borther ");
    });
  }
}
