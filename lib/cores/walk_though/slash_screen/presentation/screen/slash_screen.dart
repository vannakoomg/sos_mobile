import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/logic/slash_screen_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import '../../../../../utils/controller/utils_controller_api.dart';
import '../../../../../utils/helpers/storge_local.dart';
import 'package:go_router/go_router.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<SlashScreenController>().fetchStorgeLocal().then((value) {
      getIt<UtilsController>().fetchLanguage(lang: "en").then((value) {
        getIt<SlashScreenController>().fetchSlashScreen().then((value) async {
          getIt<SlashScreenController>()
              .slashScreenDataStorageLocal
              .removeAt(0);
          getIt<SlashScreenController>().slashScreenDataStorageLocal.add(value);
          await StorageDataLocal.storeStringList('slash_screen',
              getIt<SlashScreenController>().slashScreenDataStorageLocal);
          Future.delayed(const Duration(milliseconds: 500), () {
            context.go('/home');
          });
        });
      });
    });
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(
        (() => Center(
              child: getIt<SlashScreenController>().isFetchStorgeLocal.value
                  ? Container(
                      height: 30,
                      width: 30,
                      color: Colors.red,
                    )
                  : Text(
                      "${getIt<SlashScreenController>().slashScreenDataStorageLocal[0]}"),
            )),
      ),
    );
  }
}
