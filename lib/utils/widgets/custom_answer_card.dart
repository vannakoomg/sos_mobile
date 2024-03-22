import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

import '../../configs/const/Colors/app_colors.dart';

class CustomAnswerCrad extends StatelessWidget {
  final bool isYourOwnQuestion;
  final bool isCorrect;
  final String avarta;
  final String name;
  final String time;
  final String description;
  final String image;
  final String commentCount;
  final String likeAnswer;
  final Function ontapProfile;
  final Function ontapCorrect;
  final Function ontap;
  final bool isPosted;

  const CustomAnswerCrad({
    super.key,
    required this.isCorrect,
    required this.isYourOwnQuestion,
    required this.avarta,
    required this.name,
    required this.time,
    required this.description,
    this.image = '',
    this.isPosted = true,
    required this.commentCount,
    required this.likeAnswer,
    required this.ontapProfile,
    required this.ontapCorrect,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
        ),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.o,
          border: Border.all(
            width: 0.5,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    ontapProfile();
                                  },
                                  child:
                                      CustomCachedImageCircle(image: avarta)),
                              const Gap(5),
                              Column(
                                children: [
                                  Text(
                                    name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: AppColor.textThird,
                                            fontSize: 9),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ontapCorrect();
                          },
                          child: isCorrect == true
                              ? const Icon(
                                  Icons.task_alt_rounded,
                                  color: Colors.green,
                                )
                              : isYourOwnQuestion
                                  ? const Icon(
                                      Icons.check_circle_sharp,
                                      color: Color.fromARGB(255, 146, 146, 146),
                                    )
                                  : const SizedBox(),
                        )
                      ],
                    ),
                    const Gap(10),
                    Text(
                      description,
                      maxLines: image == "" ? 6 : 1,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    if (image != '' && isPosted == true)
                      CustomCachedImageCircle(
                        image: image,
                        height: MediaQuery.sizeOf(context).width / 2,
                        width: double.infinity,
                      ),
                    if (image != '' && isPosted == false)
                      Image.file(
                        File(image),
                        height: MediaQuery.sizeOf(context).width / 2,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8),
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 0.5,
                )),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(likeAnswer,
                      style: Theme.of(context).textTheme.bodyMedium!),
                  const SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    "assets/icons/favorite.svg",
                    height: 15,
                    width: 15,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.more_vert_rounded,
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
