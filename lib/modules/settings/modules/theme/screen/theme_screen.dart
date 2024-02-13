import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/modules/theme/controller/theme_controller.dart';
import 'package:sos_mobile/modules/settings/widgets/theme_card.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final controller = Get.put(ThemeController());
  final settingController = Get.put(SettingController());
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      controller.mode.value = settingController.setting.value.mode!;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Theme"),
        body: Obx((() => Container(
              margin: const EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changeTheme();
                    },
                    child: Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "ពេលវេលា",
                              style: Theme.of(context).textTheme.titleSmall!,
                            ),
                          ),
                          SizedBox(
                              height: 40,
                              child: settingController.setting.value.mode == "1"
                                  ? const Icon(Icons.sunny)
                                  : const Icon(Icons.nightlight_round_sharp)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))));
  }
}
