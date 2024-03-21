import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/controller/privacy_data_controller.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_offon_setting.dart';

class SettingPricacyData extends StatefulWidget {
  const SettingPricacyData({super.key});

  @override
  State<SettingPricacyData> createState() => _SettingPricacyDataState();
}

class _SettingPricacyDataState extends State<SettingPricacyData> {
  final controller = Get.put(PrivacyDataController());
  final settingController = Get.put(SettingController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Privacy and Data"),
          leadingWidth: 40,
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
        ),
        body: Obx(
          () => Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
                children: controller.privacyData.asMap().entries.map((e) {
              return Column(
                children: [
                  CustomOffOnSetting(
                      tilte: e.value.title!,
                      onChanged: () {
                        if (settingController.listOfPrivacy[e.key] == 0) {
                          settingController.listOfPrivacy[e.key] = 1;
                        } else {
                          settingController.listOfPrivacy[e.key] = 0;
                        }
                        settingController.updateSetting(
                            key: '${e.value.columName}',
                            value: settingController.listOfPrivacy[e.key]);
                      },
                      value: settingController.listOfPrivacy[e.key],
                      description: e.value.description!),
                  const Gap(20),
                ],
              );
            }).toList()),
          ),
        ));
  }
}
