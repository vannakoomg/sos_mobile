import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/feedback/controller/feedback_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_dialog.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

import '../../../../../utils/widgets/custom_textfield.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedBackController());
    return Obx(() => Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundColor,
            title: const Text("មតិកែលម្អ"),
            leadingWidth: 40,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                unFocus(context);
                controller.resetIndex();
              },
              icon: const Icon(
                Icons.close,
                // color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomButtom(
                  title: "ដាក់ស្នើ",
                  onTap: () {
                    controller.submit(context);
                  },
                  height: 30,
                  disble:
                      controller.description.value.length > 15 ? false : true,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "សូមធ្វើការផ្តល់មតិកែលម្អដោយរអាម្មរណ៏ធម្មតាតែយ៉ាងហោចណាស់សូមមាន ១០​ពាក្យ ",
                                style: Theme.of(context).textTheme.bodyLarge!),
                            const SizedBox(
                              height: 20,
                            ),
                            AnimatedRotation(
                              turns: 1,
                              alignment: Alignment.centerRight,
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 200),
                              child: CustomTextfield(
                                radius: 15,
                                hintText: "រ៉ារាប់មក",
                                onChanged: (value) {
                                  controller.description.value = value;
                                },
                                textEditController:
                                    controller.descriptionTextController.value,
                                maxLines: 4,
                                textInputType: TextInputType.multiline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (controller.isloading.value)
                const Center(
                  child: CustomLoading(),
                )
            ],
          ),
        ));
  }
}
