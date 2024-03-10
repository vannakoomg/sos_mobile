import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/comment_controller.dart';

import '../../../configs/const/Colors/app_colors.dart';
import '../../../utils/widgets/custom_buttom.dart';
import '../../../utils/widgets/custom_textfield.dart';

class PostAnwserCommentScreen extends StatefulWidget {
  final String id;
  const PostAnwserCommentScreen({
    super.key,
    required this.id,
  });

  @override
  State<PostAnwserCommentScreen> createState() =>
      _PostAnwserCommentScreenState();
}

class _PostAnwserCommentScreenState extends State<PostAnwserCommentScreen> {
  PageController? _pageController;
  final controller = Get.put(AnswerCommentController());
  final commentController = Get.put(CommentController());
  final anwserController = Get.put(AnwserController());
  @override
  void initState() {
    _pageController = PageController(initialPage: controller.currentPage.value);
    _pageController!.addListener(() {
      controller.onPageing.value = true;
      if (_pageController!.page == _pageController!.page!.roundToDouble()) {
        controller.onPageing.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.only(
                top: 15,
                left: 10,
              ),
              height: anwserController.image.value.path == "" ? 175 : 324,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Stack(
                      children: [
                        PageView(
                          onPageChanged: (value) {
                            controller.currentPage.value = value;
                          },
                          controller: _pageController,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "ចម្លើយ",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomTextfield(
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  autofocus: true,
                                  onChanged: (value) {
                                    anwserController.answerText.value = value;
                                  },
                                  hintText: "ផ្ដល់ឆ្លើយ",
                                  textEditController: anwserController
                                      .answerTexteditController.value,
                                  maxLines: 4,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                  hintTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                  color: Colors.transparent,
                                  textInputType: TextInputType.multiline,
                                ),
                                if (anwserController.image.value.path != '')
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Stack(
                                      children: [
                                        Transform.scale(
                                          scale: 0.90,
                                          child: Container(
                                            width: 110,
                                            height: 150,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.file(
                                              anwserController.image.value,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: -2,
                                          child: GestureDetector(
                                            onTap: () {
                                              anwserController.image.value =
                                                  File('');
                                            },
                                            child: const Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "មតិ",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomTextfield(
                                  contentPadding:
                                      const EdgeInsets.only(left: 5),
                                  autofocus: true,
                                  onChanged: (value) {
                                    commentController.commentText.value = value;
                                  },
                                  hintText: "ផ្ដល់ឆ្លើយ",
                                  textEditController: commentController
                                      .commetTexteditController.value,
                                  maxLines: 4,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: AppColor.textThird),
                                  hintTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                  color: Colors.transparent,
                                  textInputType: TextInputType.multiline,
                                ),
                                if (anwserController.image.value.path != '')
                                  Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Stack(
                                      children: [
                                        Transform.scale(
                                          scale: 0.90,
                                          child: Container(
                                            width: 110,
                                            height: 150,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.file(
                                              anwserController.image.value,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: -2,
                                          child: GestureDetector(
                                            onTap: () {
                                              anwserController.image.value =
                                                  File('');
                                            },
                                            child: const Icon(
                                              Icons.cancel_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                        if (controller.onPageing.value == false)
                          GestureDetector(
                            onTap: () {
                              context.pop();
                            },
                            child: Icon(
                              Icons.close,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                      ],
                    )),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: GestureDetector(
                            onTap: () {
                              anwserController.getImage();
                            },
                            child: Icon(
                              Icons.photo,
                              color: anwserController.image.value.path == ''
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        ),
                        const Spacer(),
                        CustomButtom(
                          // white: 70,
                          // borderColor: Theme.of(context).colorScheme.primary,
                          disble: controller.checkbutton(),
                          title: "យល់ព្រម",
                          onTap: () {
                            controller.ontap(widget.id).then((value) {
                              context.pop();
                            });
                          },
                          height: 30,
                          fountSize: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const Gap(5)
                  ]),
            ),
          ),
        ));
  }
}
