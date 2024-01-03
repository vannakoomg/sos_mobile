import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

import '../../../../../utils/helpers/fuction.dart';
import '../../../../../utils/widgets/custom_dialog.dart';

class FeedBackController extends GetxController {
  final controller = Get.put(SettingController());
  final isloading = false.obs;

  void resetIndex() {
    controller.index.value = -1;
  }

  final descriptionTextController = TextEditingController().obs;
  final description = ''.obs;
  Future<void> submit(BuildContext context) async {
    isloading.value = true;
    unFocus(context);
    ApiBaseHelper.apiBaseHelper.onNetworkRequesting(
        url: "/v1/feedback",
        methode: METHODE.post,
        isAuthorize: true,
        body: {
          "descrption": descriptionTextController.value.text,
        }).then((value) {
      isloading.value = false;
      customshowDialog(context, "បាទសូមអគុណ 😉");
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pop(context);
        descriptionTextController.value.text = "";
      });
    }).onError((error, stackTrace) {
      isloading.value = false;
      debugPrint("b sl soy ");
    });
  }
}
