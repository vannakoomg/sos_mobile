import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/logic/slash_screen_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import '../../../../../utils/controller/utils_controller_api.dart';
import '../../../../../utils/helpers/storge_local.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<UtilsController>().fetchLanguage(lang: "en");
    getIt<SlashScreenController>().fetchSlashScreen().then((value) async {
      await StorageDataLocal.storeData(
          "slashScreen", "${getIt<SlashScreenController>().slashScreen}");
      getIt<SlashScreenController>().slashScreen.value =
          await StorageDataLocal.getData('slashScreen');
      debugPrint(
          "dataStorge  : ${getIt<SlashScreenController>().slashScreen.value}");
    });
    // //getIt<SlashScreenController>().fetchSlashScreen().then((value) async {

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Obx(
          () => Center(
            child: Text("${getIt<SlashScreenController>().slashScreen}"),
          ),
        ));
  }
}
