import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';

import '../../../configs/const/Colors/app_colors.dart';
import '../../../utils/widgets/custom_buttom.dart';
import '../../../utils/widgets/custom_textfield.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    final controller = Get.put(AnswerCommentController());
    return Obx(() => Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              color: AppColor.textfourth,
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        Expanded(
                          child: Text(
                            "មតិ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    CustomTextfield(
                      autofocus: true,
                      onChanged: (value) {
                        controller.commentText.value = value;
                      },
                      hintText: "ផ្ដល់ឆ្លើយ",
                      textEditController:
                          controller.commetTexteditController.value,
                      maxLines: 4,
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                      hintTextStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white.withOpacity(0.8)),
                      color: Colors.transparent,
                      textInputType: TextInputType.multiline,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.image.value.path != '')
                      Stack(
                        children: [
                          Transform.scale(
                            scale: 0.86,
                            child: Container(
                              width: w * 0.35,
                              height: w * 0.35 + 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.file(
                                controller.image.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                controller.image.value = File('');
                              },
                              child: const Icon(
                                Icons.cancel_rounded,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    //
                    Row(
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Icon(
                            Icons.photo,
                            color: controller.image.value.path == ''
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        CustomButtom(
                          title: 'ឆ្លើយ',
                          onTap: () {},
                          height: 30,
                          fountSize: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
