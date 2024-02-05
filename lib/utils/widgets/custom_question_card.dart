import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../configs/const/Colors/app_colors.dart';

class CsutomQuestionCard extends StatelessWidget {
  final List<String> tags;
  final bool isCorrect;
  final String avarta;
  final String name;
  final String time;
  final String title;
  final String descrition;
  final String image;
  final String commentCount;
  final String answerCount;
  final String likeCount;
  final Function ontapProfile;
  final Function ontapQuestion;

  const CsutomQuestionCard({
    super.key,
    required this.isCorrect,
    required this.tags,
    required this.avarta,
    required this.name,
    required this.time,
    required this.image,
    required this.commentCount,
    required this.ontapProfile,
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
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColor.mainColor),
            ),
            if (descrition != '')
              Column(
                children: [
                  Text(
                    descrition,
                    maxLines: image == "" ? 6 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.textfourth, fontSize: 11),
                  ),
                ],
              ),
            const SizedBox(
              height: 5,
            ),
            if (image != '')
              CachedNetworkImage(
                imageUrl: image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tags.map((e) {
                    return Container(
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.only(
                          left: 4, right: 4, bottom: 2, top: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColor.secondnaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        "សមីការឌ៣៤៥៦៧៨",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColor.textSec, fontSize: 10),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Text(
                    commentCount,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "មតិ",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.textfourth, fontSize: 10),
                  ),
                  const Spacer(),
                  Text(
                    answerCount,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ចម្លើយ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColor.textfourth, fontSize: 10),
                  ),
                  const Spacer(),
                  Text(
                    likeCount,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.mainColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ពេញចិត្ត",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
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
