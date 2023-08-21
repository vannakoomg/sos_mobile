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
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        title: const Text("ការកំណត់"),
        backgroundColor: AppColor.mainColor,
        centerTitle: true,
        // leading: const Icon(Icons.arrow_back),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                  children: controller.settiondata.asMap().entries.map((e) {
                return GestureDetector(
                  onTap: () {
                    controller.index.value = e.key;
                    debugPrint("id ${controller.index.value}");
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    height: 45,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Text(
                      e.value,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 17, color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                );
              }).toList()),
            ),
            Text(
              "កម្មវិធីកំណែ 1.0.0",
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
