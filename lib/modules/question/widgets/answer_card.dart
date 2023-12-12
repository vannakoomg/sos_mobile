import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../configs/const/Colors/app_colors.dart';

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
    required this.image,
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
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              ontapProfile();
            },
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(avarta),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(time),
                  ],
                ),
                const Spacer(),
                isCorrect == true
                    ? const Icon(
                        Icons.check_circle_sharp,
                        color: Colors.green,
                      )
                    : isYourOwnQuestion == true
                        ? const Icon(
                            Icons.check_circle_sharp,
                            color: Colors.grey,
                          )
                        : const SizedBox()
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(description),
          const SizedBox(
            height: 5,
          ),
          if (image != '')
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          Row(
            children: [
              Text(" $commentCount មតិ "),
              const Spacer(),
              Text(likeAnswer),
              const SizedBox(
                width: 10,
              ),
              const Text("ពេញចិត្ត")
            ],
          ),
        ],
      ),
    );
  }
}
