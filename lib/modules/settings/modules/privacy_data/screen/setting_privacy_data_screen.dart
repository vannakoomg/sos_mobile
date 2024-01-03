import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/privacy_data/controller/privacy_data_controller.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/widgets/setting_off_on_card.dart';

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
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: const Text("Privacy and Data"),
          leadingWidth: 40,
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
        ),
        body: Obx(
          () => Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
                children: controller.privacyData.asMap().entries.map((e) {
              return Column(
                children: [
                  OffOnSettingCard(
                      title: e.value.title!,
                      subTitle: e.value.subtitle!,
                      ontap: () {
                        if (settingController.listOfPrivacy[e.key] == 0) {
                          settingController.listOfPrivacy[e.key] = 1;
                        } else {
                          settingController.listOfPrivacy[e.key] = 0;
                        }

                        settingController.updateSetting('${e.value.columName}',
                            settingController.listOfPrivacy[e.key]);
                      },
                      isShow: settingController.listOfPrivacy[e.key],
                      description: e.value.description!),
                  const Gap(20),
                ],
              );
            }).toList()),
          ),
        ));
  }
}
