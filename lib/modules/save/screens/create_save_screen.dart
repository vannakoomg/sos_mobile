import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/save/controller/save_category_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../../../utils/widgets/custom_buttom.dart';

class CreateSaveScreen extends StatefulWidget {
  const CreateSaveScreen({super.key});

  @override
  State<CreateSaveScreen> createState() => _CreateSaveScreenState();
}

class _CreateSaveScreenState extends State<CreateSaveScreen> {
  final controller = Get.put(SaveCategoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: CustomAppBar(
          title: "បង្កើតសៀវភៅ",
          action: CustomButtom(
            disble: controller.bookName.value == '' ? true : false,
            title: "បង្កើត",
            onTap: () {
              controller.createSaveCategory(context);
            },
            fountSize: 14,
            height: 30,
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("ក្រាប់សៀវភៅ"),
                    const Gap(10),
                    GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Container(
                        height: 120,
                        width: 90,
                        decoration: const BoxDecoration(color: Colors.pink),
                      ),
                    ),
                    const Gap(20),
                    CustomTextfield(
                      color: Colors.transparent,
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                      contentPadding: EdgeInsets.zero,
                      autofocus: true,
                      onChanged: (value) {
                        controller.bookName.value = value;
                      },
                      textEditController: controller.bookNameText.value,
                      hintText: "ឈ្មោះសៀវភៅ",
                    ),
                  ]),
            ),
          ),
        )));
  }
}
