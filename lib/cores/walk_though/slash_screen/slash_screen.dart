import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';

import '../../../utils/controller/utils_controller_api.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<UtilsControllerApi>().fetchLanguage(lang: "en");
    getIt<UtilsControllerApi>().fetchSlashScreen();
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: const Center(child: Text("nice to meet ")),
    );
  }
}
