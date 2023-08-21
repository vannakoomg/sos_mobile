import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/screens/feedback_screen.dart';
import 'package:sos_mobile/modules/settings/screens/privacy_data_screen.dart';
import 'package:sos_mobile/modules/settings/screens/setting.dart';
import 'package:sos_mobile/modules/settings/screens/theme_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.mainColor,
          body: Obx(
            () => SingleChildScrollView(
              child: SizedBox(
                height: h,
                width: w,
                child: Stack(
                  children: [
                    const Settings(),
                    AnimatedPositioned(
                      curve: Curves.ease,
                      top: controller.index.value == 3 ? 0 : h,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: AnimatedOpacity(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 400),
                            opacity: controller.index.value == 3 ? 1 : 0,
                            child: const PrivacyDataScreen()),
                      ),
                    ),
                    AnimatedPositioned(
                      curve: Curves.ease,
                      top: controller.index.value == 2 ? 0 : h,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: AnimatedOpacity(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 400),
                            opacity: controller.index.value == 2 ? 1 : 0,
                            child: const ThemeScreen()),
                      ),
                    ),
                    AnimatedPositioned(
                      curve: Curves.ease,
                      top: controller.index.value == 6 ? 0 : h,
                      duration: const Duration(milliseconds: 500),
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: AnimatedOpacity(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 400),
                            opacity: controller.index.value == 6 ? 1 : 0,
                            child: const FeedBackScreen()),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
