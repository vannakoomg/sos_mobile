import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

import '../../configs/const/Colors/app_colors.dart';

class CsutomQuestionCard extends StatelessWidget {
  final List<String> tags;
  final bool isCorrect;
  final String time;
  final String title;
  final String descrition;
  final String image;
  final String commentCount;
  final String answerCount;
  final String likeCount;
  final Function ontapQuestion;
  final bool istall;

  const CsutomQuestionCard({
    super.key,
    this.istall = true,
    required this.isCorrect,
    required this.tags,
    required this.time,
    required this.image,
    required this.commentCount,
    required this.title,
    required this.likeCount,
    required this.answerCount,
    required this.ontapQuestion,
    this.descrition = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontapQuestion();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 3,
        ),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                      const Gap(1),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          time,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColor.textfourth, fontSize: 9),
                        ),
                      ),
                    ],
                  ),
                  if (descrition != '')
                    Text(
                      descrition,
                      maxLines: image == "" ? 6 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.textfourth, fontSize: 11),
                    ),
                  if (image != '')
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: CustomCachedImageCircle(
                        borderRadius: BorderRadius.circular(10),
                        height: istall
                            ? MediaQuery.sizeOf(context).height / 1.7
                            : MediaQuery.sizeOf(context).width / 2,
                        width: double.infinity,
                        image: image,
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tags.map((e) {
                          return Container(
                            margin: const EdgeInsets.only(right: 2.5),
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, bottom: 2, top: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 74, 126),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "សមីការឌ៣៤៥៦៧៨",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColor.primaryColor,
                                        fontSize: 8),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 2, top: 8),
              height: 0.3,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Text(
                    commentCount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "មតិ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.textfourth),
                  ),
                  const Spacer(),
                  Text(
                    answerCount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ចម្លើយ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColor.textfourth,
                        ),
                  ),
                  const Spacer(),
                  Text(
                    likeCount,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ពេញចិត្ត",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.textfourth, fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
