import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(
        title: "ការកំណត់",
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
                        if (e.key == 7)
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            height: 0.1,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        GestureDetector(
                          onTap: () {
                            context.goNamed(e.value.router);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 5, right: 10, bottom: 5),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 40,
                            padding: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              e.value.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: AppColor.textThird),
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
