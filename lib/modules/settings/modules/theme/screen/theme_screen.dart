import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/theme/controller/theme_controller.dart';
import 'package:sos_mobile/modules/settings/widgets/theme_card.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(() => Scaffold(
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
          body: Container(
            margin: const EdgeInsets.only(left: 5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(controller.fountSize.value.toString()),
                ThemeCard(
                  isTure: true,
                  ontap: () {},
                  subtilte: 'បើក',
                  title: 'ពេញចិត្តពេលចុចពីរដង',
                ),
                Row(
                  children: [
                    Text(
                      "ពន្យាលពេល Splas Screen",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      width: 100,
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomTextfield(
                            maxLength: 4,
                            color: Colors.transparent,
                            subfix: const Text("ms"),
                            textAlign: TextAlign.right,
                            hintText: '',
                            onChanged: (value) {
                              // if (value == '') {
                              //   controller.durationTextController.value.text =
                              //       '0';
                              // }
                            },
                            textInputType: TextInputType.number,
                            textEditController:
                                controller.durationTextController.value,
                          )),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
