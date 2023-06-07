import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/post_question/controllers/post_question_controller.dart';

import '../../../utils/widgets/custom_tag_card.dart';
import '../../../utils/widgets/custom_textfield.dart';
import '../models/tag_model.dart';

class PostQuestionScreen extends StatelessWidget {
  const PostQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostQuestionController());
    final scrollerController = ScrollController();
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Obx(
          () => Column(
            children: [
              SingleChildScrollView(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 10,
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration:
                                  const BoxDecoration(color: Colors.blue),
                            ))
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
                                Text(
                                  "Photo",
                                  style: Theme.of(context).textTheme.titleSmall,
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
                                                    BorderRadius.circular(10),
                                                color: AppColor.primaryColor,
                                              ),
                                              child: PageView(
                                                  onPageChanged: (index) {
                                                    controller
                                                        .onPageChanged(index);
                                                  },
                                                  children: controller.listImage
                                                      .map((element) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor
                                                            .primaryColor,
                                                        image: DecorationImage(
                                                            image: FileImage(
                                                                element),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    );
                                                  }).toList()),
                                            ),
                                            Positioned(
                                              top: 10,
                                              right: 10,
                                              child: GestureDetector(
                                                onTap: () {
                                                  controller.listImage.removeAt(
                                                      controller.index.value);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: const Center(
                                                      child: Icon(
                                                    Icons.close,
                                                    size: 20,
                                                  )),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColor.primaryColor),
                                        ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AnimatedContainer(
                                  height:
                                      controller.tagtext.value == "" ? 50 : 410,
                                  padding: const EdgeInsets.only(left: 10),
                                  duration: const Duration(milliseconds: 600),
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Stack(
                                    children: [
                                      if (controller.tagtext.value != '')
                                        Positioned(
                                          top: 40,
                                          child: Container(
                                            height: 340,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                20,
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.listTag
                                                              .add(TagModel(
                                                                  title:
                                                                      "b sl sy ",
                                                                  id: "1234"));
                                                        },
                                                        child: Expanded(
                                                            child: Container(
                                                          color: const Color(
                                                              0xff343a40),
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            left: 5,
                                                            top: 5,
                                                            right: 5,
                                                          ),
                                                          child: const Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomTapCard(
                                                                    title:
                                                                        "សមីការ"),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                    "lkjdslfkfjdslksfjlkdddsfdsfdsfdsfdsfdsfdsfdsfdsfdsfdssjflkdsjflkdsjflsjfljdslkfjdslkfjsldfjlkdsjlksjd")
                                                              ]),
                                                        )),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              60, 134, 198),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              179, 158, 43),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          color: const Color(
                                                              0xff6c757d),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      Row(
                                        children: [
                                          if (controller.listTag.isNotEmpty)
                                            Row(
                                              children: controller.listTag
                                                  .map((element) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: CustomTapCard(
                                                      title: element.title!),
                                                );
                                              }).toList(),
                                            ),
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  controller.tagTextfield.value,
                                              onChanged: (value) {
                                                controller.tagtext.value =
                                                    value;
                                                if (controller
                                                        .tagtext.value.length ==
                                                    1) {
                                                  Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000),
                                                    () {
                                                      scrollerController
                                                          .animateTo(
                                                        600,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.easeIn,
                                                      );
                                                    },
                                                  );
                                                }
                                              },
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              decoration: const InputDecoration(
                                                  hintText: "Tag",
                                                  hintStyle: TextStyle(
                                                      color: Colors.black),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: 40,
                width: 200,
                color: Colors.red,
              )),
            ],
          ),
        ));
  }
}
