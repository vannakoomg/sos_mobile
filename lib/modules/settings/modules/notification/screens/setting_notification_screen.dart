import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/modules/notification/controller/setting_notification_controller.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_offon_setting.dart';

class SettingNotificationScreen extends StatefulWidget {
  const SettingNotificationScreen({super.key});

  @override
  State<SettingNotificationScreen> createState() =>
      _SettingNotificationScreenState();
}

class _SettingNotificationScreenState extends State<SettingNotificationScreen> {
  final controller = Get.put(SettingNotificationController());
  final settingController = Get.put(SettingController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Notification",
      ),
      body: Obx(() => Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
                children: controller.notificationData.asMap().entries.map((e) {
              return Column(
                children: [
                  CustomOffOnSetting(
                    tilte: e.value.title!,
                    description: e.value.description!,
                    value: settingController.listOfNotification[e.key] == 0
                        ? false
                        : true,
                    onChanged: (value) {
                      if (settingController.listOfNotification[e.key] == 0) {
                        settingController.listOfNotification[e.key] = 1;
                      } else {
                        settingController.listOfNotification[e.key] = 0;
                      }
                      settingController.updateSetting(
                        key: '${e.value.columName}',
                        value: settingController.listOfNotification[e.key],
                      );
                    },
                  ),
                  const Gap(20),
                ],
              );
            }).toList()),
          )),
    );
  }
}
