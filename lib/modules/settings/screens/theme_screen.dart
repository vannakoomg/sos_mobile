import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/theme_controller.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(() => Scaffold(
          backgroundColor: AppColor.mainColor,
          appBar: AppBar(
            title: const Text("Theme"),
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
          body: SizedBox(
            width: double.infinity,
            // margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(controller.fountSize.value.toString())],
            ),
          ),
        ));
  }
}
