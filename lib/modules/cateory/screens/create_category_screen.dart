import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/cateory/controller/category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../../../utils/widgets/custom_buttom.dart';

class CreateSaveScreen extends StatefulWidget {
  const CreateSaveScreen({super.key});

  @override
  State<CreateSaveScreen> createState() => _CreateSaveScreenState();
}

class _CreateSaveScreenState extends State<CreateSaveScreen> {
  final controller = Get.put(CategoryController());

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
            white: 60,
            height: 30,
          ),
        ),
        body: Obx(
          () => SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ក្រាប់សៀវភៅ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                        const Gap(20),
                        GestureDetector(
                          onTap: () {
                            controller.getCoverBook();
                          },
                          child: SizedBox(
                            height: 140,
                            width: 100,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 120,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onTertiary),
                                      borderRadius: BorderRadius.circular(10),
                                      image: controller.coverBook.value.path ==
                                              ""
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(
                                                  controller.coverBook.value),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                    child: Text(
                                        controller.bookName.value.trim(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ),
                                ),
                                Positioned(
                                  right: 15,
                                  top: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.coverBook.value = File('');
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: AppColor.textfourth,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.close_rounded,
                                        size: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onTertiary,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        CustomTextfield(
                          color: Colors.transparent,
                          hintTextStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 18),
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  fontSize: 18),
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
                if (controller.isloading.value)
                  const Center(
                    child: CustomLoading(),
                  )
              ],
            ),
          ),
        )));
  }
}
