import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text(
          "ការកំណត់",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                      children: controller.settiondata.asMap().entries.map((e) {
                    return Column(
                      children: [
                        if (e.key == 6)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            height: 0.1,
                            color: AppColor.mainColor,
                          ),
                        GestureDetector(
                          onTap: () {
                            controller.index.value = e.key;
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 5),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              e.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 18, color: AppColor.textThird),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
