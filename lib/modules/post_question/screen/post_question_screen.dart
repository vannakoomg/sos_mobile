import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/post_question/controllers/post_question_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_tag_card.dart';

import '../../../utils/widgets/custom_textfield.dart';

class PostQuestionScreen extends StatelessWidget {
  const PostQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final controller = Get.put(PostQuestionController());
    return SafeArea(
        child: Obx(
      () => Container(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "សំនួរ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                CustomTextfield(
                                  hintText: "ចំណងជើង",
                                  onChanged: (value) {},
                                  textEditController:
                                      controller.titleTextEditController.value,
                                  maxLines: 1,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextfield(
                                  hintText: "អត្តន័យ",
                                  onChanged: (value) {},
                                  textEditController: controller
                                      .descriptionTextController.value,
                                  maxLines: 4,
                                  textInputType: TextInputType.multiline,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    controller.getImage();
                                  },
                                  child: controller.image.value.path != ''
                                      ? Stack(
                                          children: [
                                            Container(
                                                height: 300,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColor.primaryColor,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColor.primaryColor,
                                                    image: DecorationImage(
                                                        image: FileImage(
                                                            controller
                                                                .image.value),
                                                        fit: BoxFit.cover),
                                                  ),
                                                )),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.image.value =
                                                      File('');
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.6),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
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
                                        )
                                      : Container(
                                          clipBehavior: Clip.antiAlias,
                                          padding: const EdgeInsets.only(
                                              top: 5, left: 10),
                                          height: 300,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColor.primaryColor),
                                          child: Column(children: [
                                            const Spacer(),
                                            Icon(
                                              Icons.photo,
                                              color: AppColor.mainColor
                                                  .withOpacity(0.6),
                                              size: 60,
                                            ),
                                            Text(
                                              "រូបភាពអត់ដាក់ក៏បានដែល",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!,
                                            ),
                                            const Spacer(),
                                          ]),
                                        ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.primaryColor,
                                  ),
                                  child: Container(
                                    margin: controller.listOfTag.isNotEmpty
                                        ? const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          )
                                        : null,
                                    child: SingleChildScrollView(
                                      controller: scrollController,
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Row(
                                                children: controller.listOfTag
                                                    .asMap()
                                                    .entries
                                                    .map((element) {
                                                  return Row(
                                                    children: [
                                                      if (element.key >= 1)
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                      element.key >= 0
                                                          ? CustomTagCard(
                                                              isOnSearch: false,
                                                              title:
                                                                  'math ដសហ្ថក្ដសហថ្ក- k',
                                                              ontap: () {
                                                                controller
                                                                    .listOfTag
                                                                    .removeAt(
                                                                        element
                                                                            .key);
                                                                if (controller
                                                                    .listOfTag
                                                                    .isEmpty) {
                                                                  controller
                                                                      .tagtext
                                                                      .value = '';
                                                                  controller
                                                                      .tagTextController
                                                                      .value
                                                                      .text = '';
                                                                }
                                                              },
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  );
                                                }).toList(),
                                              )),
                                          SizedBox(
                                            width: 150,
                                            child: CustomTextfield(
                                              textInputType:
                                                  TextInputType.visiblePassword,
                                              color: Colors.transparent,
                                              hintText: "tag",
                                              onChanged: (value) {
                                                controller.tagtext.value =
                                                    value;
                                              },
                                              textEditController: controller
                                                  .tagTextController.value,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomButtom(
                                  disble: controller.validationPost(),
                                  title: "Post",
                                  onTap: () {
                                    debugPrint(
                                        "nice to meet you ${controller.listOfTag} ");
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.tagtext.value != '')
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                width: double.infinity,
                child: Wrap(children: [
                  CustomTagCard(
                    title: 'សមីការ',
                    ontap: () {
                      scrollController.animateTo(500,
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.ease);
                      controller.tagtext.value = '';
                      controller.tagTextController.value.text = ' ';
                      controller.listOfTag.add('ddd');
                    },
                  ),
                ]),
              ),
          ],
        ),
      ),
    ));
  }
}
