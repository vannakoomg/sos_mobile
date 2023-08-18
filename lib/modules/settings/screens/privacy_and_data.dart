import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/privacy_data_controller.dart';
import 'package:sos_mobile/modules/settings/widgets/privacy_data_card.dart';

class PrivacyDataScreen extends StatelessWidget {
  const PrivacyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PrivacyDataController());
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        title: const Text("Privacy and Data"),
        leadingWidth: 40,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              controller.resetIndex();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 0),
        child: Column(children: [
          PrivacyDataCrad(
            title: "Account",
            subTitle: "Public",
            ontap: () {},
            isTrue: true,
            description:
                "Allow every one see your profile photo and everything you ask post ",
          ),
          const SizedBox(
            height: 40,
          ),
          PrivacyDataCrad(
            title: "CSCC",
            subTitle: "On",
            ontap: () {},
            isTrue: true,
            description: "Allow every one see your count ",
          ),
          const SizedBox(
            height: 40,
          ),
          PrivacyDataCrad(
            title: "Answer",
            subTitle: "On",
            ontap: () {},
            isTrue: true,
            description: "Allow every one see your the Question You Answer ",
          ),
          const SizedBox(
            height: 40,
          ),
          PrivacyDataCrad(
            title: "Ask",
            subTitle: "On",
            ontap: () {},
            isTrue: true,
            description: "Allow every one see your the Question You Ask ",
          ),
        ]),
      ),
    );
  }
}
