import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/post_question/controllers/post_question_controller.dart';
import 'package:sos_mobile/modules/post_question/models/tag_model.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_tag_card.dart';
import '../../../utils/widgets/custom_textfield.dart';

class PostQuestionScreen extends StatelessWidget {
  const PostQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostQuestionController());
    return Container(
      color: AppColor.backgroundColor,
      child: SafeArea(
          child: Obx(
        () => Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
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
                              title: "សូមសួរមួយ ?",
                              onTap: () {
                                controller.postQuestion();
                              },
                              fountSize: 14,
                              height: 30,
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
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.primaryColor,
                                    // border: Border.all(),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextfield(
                                        readOnly:
                                            controller.selectTags.length < 3
                                                ? false
                                                : true,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        hintTextStyle:
                                            controller.selectTags.length < 3
                                                ? null
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        color: AppColor
                                                            .warningColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                        hintText:
                                            controller.selectTags.length < 3
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
                                              bottom: controller
                                                      .selectTags.isNotEmpty
                                                  ? 10
                                                  : 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Wrap(
                                            children: controller.selectTags
                                                .asMap()
                                                .entries
                                                .map((element) {
                                              return Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 0),
                                                child: CustomTagCard(
                                                  isOnSearch: false,
                                                  title:
                                                      '${element.value.name}',
                                                  ontap: () {
                                                    controller
                                                        .removeTag(element.key);
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
                                                    color: AppColor.mainColor
                                                        .withOpacity(0.4),
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
              if (controller.tagsData.value.tags != null &&
                  controller.tagtext.value != '')
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                      children: controller.tagsData.value.tags!
                          .asMap()
                          .entries
                          .map((e) {
                    return CustomTagCard(
                      title: e.value.name!,
                      ontap: () {
                        controller.onSelectTag(
                            Tags(id: e.value.id, name: e.value.name));
                      },
                    );
                  }).toList()),
                ),
            ],
          ),
        ),
      )),
    );
  }
}
