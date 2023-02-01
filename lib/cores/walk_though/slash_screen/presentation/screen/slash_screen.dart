import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/presentation/logic/slash_screen_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'package:go_router/go_router.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      context.go('/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
