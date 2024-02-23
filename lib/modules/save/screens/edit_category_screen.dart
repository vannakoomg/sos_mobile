import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';
import 'package:sos_mobile/modules/save/controller/edit_category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../../../utils/widgets/custom_buttom.dart';

class EditCategoryScreen extends StatefulWidget {
  final String coverUrl;
  final String id;
  const EditCategoryScreen({
    super.key,
    required this.coverUrl,
    required this.id,
  });

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final controller = EditCategoryController();
  final categoryController = Get.put(SaveCategoryController());
  @override
  void initState() {
    controller.bookNameText.value.text = categoryController.title.value;
    controller.bookName.value = categoryController.title.value;
    controller.oldBooKName.value = categoryController.title.value;
    controller.oldCoverBook.value = widget.coverUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: CustomAppBar(
          isClose: true,
          title: "កែប្រែ",
          action: CustomButtom(
            disble: (controller.bookName.value != '' &&
                        controller.oldBooKName.value !=
                            controller.bookName.value) ||
                    controller.coverBook.value.path != ""
                ? false
                : true,
            title: "កែប្រែ",
            onTap: () {
              controller.editCategory(id: widget.id).then((value) {
                categoryController.title.value = controller.bookName.value;
                categoryController
                    .saveCategory
                    .value
                    .data![categoryController.index.value]
                    .name = controller.bookName.value;
                categoryController.saveCategory.refresh();
                context.pop();
              });
            },
            fountSize: 14,
            white: 60,
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
                    Text(
                      "ក្រាប់សៀវភៅ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
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
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiary),
                                  borderRadius: BorderRadius.circular(10),
                                  image: controller.oldCoverBook.value == ""
                                      ? controller.coverBook.value.path == ""
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(
                                                  controller.coverBook.value),
                                              fit: BoxFit.cover,
                                            )
                                      : DecorationImage(
                                          image: NetworkImage(
                                              controller.oldCoverBook.value),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                child: Text(controller.bookName.value,
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                              ),
                            ),
                            Positioned(
                              right: 15,
                              top: 2,
                              child: GestureDetector(
                                onTap: () {
                                  controller.coverBook.value = File('');
                                  controller.oldCoverBook.value = "";
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
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 18),
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
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
          ),
        )));
  }
}
