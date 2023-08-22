import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/controllers/feedback_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_dialog.dart';

import '../../../utils/widgets/custom_textfield.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedBackController());
    return Obx(() => Scaffold(
          backgroundColor: AppColor.mainColor,
          appBar: AppBar(
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
                color: Colors.white,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CustomButtom(
                  title: "ដាក់ស្នើ",
                  onTap: () {
                    unFocus(context);
                    customshowDialog(context, "សូមអគុណ");
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Navigator.pop(context);
                      controller.descriptionTextController.value =
                          TextEditingController();
                      controller.description.value = '';
                    });
                  },
                  height: 30,
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
                                "សូមធ្វើការអោយមតិកែលម្អដោយសារអាម្មរណ៏ Free ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.white.withOpacity(0.9)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedRotation(
                                turns: controller.description.value.length >= 2
                                    ? 0.98
                                    : 1,
                                alignment: Alignment.centerRight,
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 200),
                                child: CustomTextfield(
                                  hintText: "អត្តន័យ",
                                  onChanged: (value) {
                                    controller.description.value = value;
                                  },
                                  textEditController: controller
                                      .descriptionTextController.value,
                                  maxLines: 4,
                                  textInputType: TextInputType.multiline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
