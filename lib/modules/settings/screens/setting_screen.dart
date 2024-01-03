import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/screens/setting.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final controller = Get.put(SettingController());

  @override
  void initState() {
    controller.index.value = -1;
    controller.fetchSetting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Obx(
        () => SingleChildScrollView(
          child: SizedBox(
            height: h,
            width: w,
            child: Stack(
              children: [
                const Settings(),
                Stack(
                  children: controller.settingScreen.asMap().entries.map(
                    (e) {
                      return AnimatedPositioned(
                        curve: Curves.ease,
                        top: controller.index.value == e.key ? 0 : h,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          height: h,
                          width: w,
                          child: AnimatedOpacity(
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 400),
                            opacity: controller.index.value == e.key ? 1 : 0,
                            child: e.value,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
