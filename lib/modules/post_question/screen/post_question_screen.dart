import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/post_question/controllers/post_question_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_tag_card.dart';

import '../../../utils/widgets/custom_textfield.dart';

class PostQuestionScreen extends StatelessWidget {
  const PostQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final controller = Get.put(PostQuestionController());
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Obx(
          () => Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                child: Text(
                                  "Question",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
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
                                      textEditController: null,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CustomTextfield(
                                      hintText: "អត្តន័យ",
                                      onChanged: (value) {},
                                      textEditController: null,
                                      maxLines: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        controller.getImage();
                                      },
                                      child: controller.listImage.isNotEmpty
                                          ? Stack(
                                              children: [
                                                Container(
                                                  height: 300,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color:
                                                        AppColor.primaryColor,
                                                  ),
                                                  child: PageView(
                                                      onPageChanged: (index) {
                                                        controller
                                                            .onPageChanged(
                                                                index);
                                                      },
                                                      children: controller
                                                          .listImage
                                                          .map((element) {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: AppColor
                                                                .primaryColor,
                                                            image: DecorationImage(
                                                                image: FileImage(
                                                                    element),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        );
                                                      }).toList()),
                                                ),
                                                Positioned(
                                                  top: 10,
                                                  right: 10,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.listImage
                                                          .removeAt(controller
                                                              .index.value);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          color: Colors.black
                                                              .withOpacity(0.6),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 10),
                                              height: 300,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColor.primaryColor),
                                              child: Text(
                                                "រូបភាព",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      height: 10,
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
                                                    children: controller
                                                        .listOfTag
                                                        .asMap()
                                                        .entries
                                                        .map((element) {
                                                      return Row(
                                                        children: [
                                                          if (element.key >= 2)
                                                            const SizedBox(
                                                              width: 4,
                                                            ),
                                                          element.key >= 1
                                                              ? CustomTagCard(
                                                                  isOnSearch:
                                                                      false,
                                                                  title:
                                                                      'math ដសហ្ថក្ដសហថ្ក- k',
                                                                  ontap: () {
                                                                    controller
                                                                        .listOfTag
                                                                        .removeAt(
                                                                            element.key);
                                                                    if (controller
                                                                        .listOfTag
                                                                        .isEmpty) {
                                                                      controller
                                                                          .tagtext
                                                                          .value = '';
                                                                      controller
                                                                          .tagTextEditController
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
                                                  textInputType: TextInputType
                                                      .visiblePassword,
                                                  ishaveColor: false,
                                                  hintText: "tag",
                                                  onChanged: (value) {
                                                    controller.tagtext.value =
                                                        value;
                                                  },
                                                  textEditController: controller
                                                      .tagTextEditController
                                                      .value,
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
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
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
                      bottom: 8,
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
                          controller.tagTextEditController.value.text = ' ';
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
