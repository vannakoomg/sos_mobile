import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/logic/slash_screen_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import '../../../../../utils/controller/utils_controller_api.dart';
import '../../../../../utils/helpers/storge_local.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    getIt<UtilsController>().fetchLanguage(lang: "en");
    getIt<SlashScreenController>().fetchSlashScreen().then((value) async {
      getIt<SlashScreenController>().slashScreenDataStorageLocal.add(value);
      debugPrint(
          "value ${getIt<SlashScreenController>().slashScreenDataStorageLocal}");
      await StorageDataLocal.storeStringList('slash_screen',
          "${getIt<SlashScreenController>().slashScreenDataStorageLocal.toList()}");
      // getIt<SlashScreenController>().slashScreenDataStorageLocal.value =
      //     await StorageDataLocal.getStringList('slashScreen');
      // debugPrint(
      //     "dataStorge  : ${getIt<SlashScreenController>().slashScreen.value}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor, body: Container());
  }
}
