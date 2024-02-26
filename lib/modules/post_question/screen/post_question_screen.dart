import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/post_question/controllers/post_question_controller.dart';
import 'package:sos_mobile/modules/post_question/models/tag_model.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_tag_card.dart';
import '../../../utils/widgets/custom_textfield.dart';

class PostQuestionScreen extends StatefulWidget {
  const PostQuestionScreen({super.key});

  @override
  State<PostQuestionScreen> createState() => _PostQuestionScreenState();
}

class _PostQuestionScreenState extends State<PostQuestionScreen> {
  final controller = Get.put(PostQuestionController());
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    controller.isFocus.value = false;
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          controller.isFocus.value = true;
        } else {
          controller.isFocus.value = false;
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: MediaQuery.sizeOf(context).height,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            CustomAppBar(
              title: "សួរ",
              leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.tertiary,
                  )),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 5, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextfield(
                        hintText: "ចំណងជើង",
                        onChanged: (value) {
                          controller.title.value = value;
                        },
                        textEditController:
                            controller.titleTextEditController.value,
                        maxLines: 1,
                      ),
                      const Gap(5),
                      CustomTextfield(
                        radius: 8,
                        hintText: "អត្តន័យ",
                        onChanged: (value) {
                          controller.description.value = value;
                        },
                        textEditController:
                            controller.descriptionTextController.value,
                        maxLines: 4,
                        textInputType: TextInputType.multiline,
                      ),
                      const Gap(5),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextfield(
                              focusNode: focusNode,
                              readOnly: controller.selectTags.length < 3
                                  ? false
                                  : true,
                              textInputType: TextInputType.visiblePassword,
                              hintTextStyle: controller.selectTags.length < 3
                                  ? null
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: AppColor.warningColor,
                                          fontWeight: FontWeight.w600),
                              hintText: controller.selectTags.length < 3
                                  ? "ពាក្យសម្គាល់"
                                  : "ពាក្យសម្គាល់គ្រាប់ហើយ",
                              onChanged: (value) {
                                controller.tagtext.value = value;
                                controller.fetchTag(value);
                              },
                              textEditController:
                                  controller.tagTextController.value,
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 15,
                                    right: 5,
                                    bottom: controller.selectTags.isNotEmpty
                                        ? 10
                                        : 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Wrap(
                                  spacing: 5,
                                  children: controller.selectTags
                                      .asMap()
                                      .entries
                                      .map((element) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 0),
                                      child: CustomTagCard(
                                        isOnSearch: false,
                                        title: '${element.value.name}',
                                        ontap: () {
                                          controller.removeTag(element.key);
                                        },
                                      ),
                                    );
                                  }).toList(),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (controller.image.value.path != '')
                        Stack(
                          children: [
                            Container(
                                width: 120,
                                height: 170,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.primaryColor,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    image: DecorationImage(
                                        image:
                                            FileImage(controller.image.value),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  controller.image.value = File('');
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                      child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 16,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.onTertiary,
              child: controller.tagsData.value.tags != null &&
                      controller.tagtext.value != '' &&
                      controller.tagtext.value.length < 20 &&
                      controller.isFocus.value
                  ? Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        bottom: 5,
                      ),
                      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                      decoration: BoxDecoration(
                          border: controller.tagtext.value.length < 3 &&
                                      controller.tagsData.value.tags!.isEmpty ||
                                  controller.selectTags.any((element) =>
                                      element.name == controller.tagtext.value)
                              ? null
                              : Border(
                                  top: BorderSide(
                                      width: 0.2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: controller.tagsData.value.tags!
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return CustomTagCard(
                                    isTheSame: e.value.name!.trim() ==
                                            controller.tagtext.value.trim()
                                        ? true
                                        : false,
                                    title: e.value.name!,
                                    ontap: () {
                                      controller.onSelectTag(Tags(
                                          id: e.value.id, name: e.value.name));
                                    },
                                  );
                                }).toList()),
                          ),
                          if (!controller.tagsData.value.tags!.any((element) =>
                                  element.name == controller.tagtext.value) &&
                              !controller.selectTags.any((element) =>
                                  element.name == controller.tagtext.value) &&
                              controller.tagtext.value.length > 2)
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "ពាក្យនេះមិនទាន់មានទេតើអ្នកចង់បន្លែមវាដែលរឺទេ​?",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                CustomButtom(
                                  colors:
                                      const Color.fromARGB(255, 46, 134, 49),
                                  title: "បាទ/ចាស",
                                  fountSize: 12,
                                  onTap: () {
                                    controller.createTag(
                                      controller.tagtext.value.trim(),
                                    );
                                  },
                                  height: 23,
                                )
                              ],
                            )
                        ],
                      ))
                  : Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.getImageGallery();
                            },
                            icon: const Icon(Icons.photo)),
                        IconButton(
                            onPressed: () {
                              controller.getImageCamera();
                            },
                            icon: const Icon(Icons.camera_alt)),
                        const Spacer(),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButtom(
                                disble: controller.validationPost(),
                                title: "សួរមួយ?",
                                onTap: () {
                                  unFocus(context);
                                  controller.postQuestion().then((value) {
                                    context.pop();
                                  });
                                },
                                fountSize: 14,
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
