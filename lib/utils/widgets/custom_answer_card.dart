import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  final Function ontapComment;

  const CustomAnswerCrad({
    super.key,
    required this.isCorrect,
    required this.isYourOwnQuestion,
    required this.avarta,
    required this.name,
    required this.time,
    required this.description,
    this.image = '',
    required this.commentCount,
    required this.likeAnswer,
    required this.ontapProfile,
    required this.ontapCorrect,
    required this.ontapComment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        border: Border.all(width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: avarta,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    const Gap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: AppColor.secondnaryColor,
                                  fontWeight: FontWeight.w600),
                        ),
                        Text(
                          time,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColor.textThird,
                                  ),
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
                        Icons.check_circle_sharp,
                        color: Colors.green,
                      )
                    : isYourOwnQuestion
                        ? const Icon(
                            Icons.check_circle_sharp,
                            color: Color.fromARGB(255, 124, 107, 96),
                          )
                        : const SizedBox(),
              )
            ],
          ),
          Text(
            description,
            maxLines: image == "" ? 6 : 1,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColor.textfourth,
                ),
            overflow: TextOverflow.ellipsis,
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
          Row(
            children: [
              Text(commentCount,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.mainColor,
                      )),
              const SizedBox(
                width: 5,
              ),
              Text(
                "មតិ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.textThird),
              ),
              const Spacer(),
              Text(likeAnswer,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColor.mainColor,
                      )),
              const SizedBox(
                width: 5,
              ),
              Text(
                "ពេញចិត្ត",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.textThird),
              )
            ],
          ),
        ],
      ),
    );
  }
}
