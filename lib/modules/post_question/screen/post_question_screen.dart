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
    return Container(
      color: AppColor.backgroundColor,
      child: SafeArea(
          child: Obx(
        () => Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "ខ្ញុំបាទ​",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            CustomButtom(
                              title: "សូមសួរមួយ",
                              onTap: () {},
                              fountSize: 15,
                              height: 35,
                            )
                          ],
                        ),
                      ),
                      Column(
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
                                  radius: 20,
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
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColor.primaryColor,
                                      border: Border.all()),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: CustomTextfield(
                                          isBorder: false,
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          hintText: "ពាក្យសម្គាល់",
                                          onChanged: (value) {
                                            controller.tagtext.value = value;
                                          },
                                          textEditController: controller
                                              .tagTextController.value,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(
                                              left: 15,
                                              right: 5,
                                              top: 0,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Wrap(
                                            children: controller.listOfTag
                                                .asMap()
                                                .entries
                                                .map((element) {
                                              return CustomTagCard(
                                                isOnSearch: false,
                                                title:
                                                    'math math ${element.key}',
                                                ontap: () {
                                                  controller.listOfTag
                                                      .removeAt(element.key);
                                                  if (controller
                                                      .listOfTag.isEmpty) {
                                                    controller.tagtext.value =
                                                        '';
                                                    controller.tagTextController
                                                            .value =
                                                        TextEditingController();
                                                  }
                                                },
                                              );
                                            }).toList(),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                controller.image.value.path != ''
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
                                                  color: AppColor.primaryColor,
                                                  image: DecorationImage(
                                                      image: FileImage(
                                                          controller
                                                              .image.value),
                                                      fit: BoxFit.cover),
                                                ),
                                              )),
                                          Positioned(
                                            top: 5,
                                            right: 5,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.image.value =
                                                    File('');
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: AppColor
                                                        .secondnaryColor
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
                                              icon:
                                                  const Icon(Icons.camera_alt))
                                        ],
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.tagtext.value != '')
                Container(
                  margin: const EdgeInsets.only(
                    top: 5,
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
                        controller.tagTextController.value.text = '';
                        controller.listOfTag.add('ddd');
                      },
                    ),
                  ]),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
