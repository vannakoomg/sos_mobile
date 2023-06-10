import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../configs/const/app_colors.dart';

class CustomAnswerCrad extends StatelessWidget {
  final bool isYourOwnQuestion;
  final String avarta;
  final String name;
  final String time;
  final String title;
  final String description;
  final List<String> image;
  final String commentCount;
  final String likeComment;
  final Function ontapProfile;
  final Function ontapCorrect;
  final Function ontapComment;
  final Function ontapDislikeComment;
  final Function ontapLikeComment;

  const CustomAnswerCrad({
    super.key,
    required this.isYourOwnQuestion,
    required this.avarta,
    required this.name,
    required this.time,
    required this.description,
    required this.title,
    required this.image,
    required this.commentCount,
    required this.likeComment,
    required this.ontapProfile,
    required this.ontapCorrect,
    required this.ontapComment,
    required this.ontapDislikeComment,
    required this.ontapLikeComment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 20, right: 10),
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
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(avarta), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name),
                    Text(time),
                  ],
                ),
                const Spacer(),
                if (isYourOwnQuestion == true)
                  Container(
                    height: 20,
                    width: 20,
                    color: Colors.green,
                  ),
              ],
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description),
          if (image.isNotEmpty)
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                  children: image.map((e) {
                return CachedNetworkImage(
                  imageUrl: e,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }).toList()),
            ),
          Row(
            children: [
              Text(" $commentCount comment "),
              const Spacer(),
              const Text("-"),
              Text(likeComment),
              const Text("+")
            ],
          ),
        ],
      ),
    );
  }
}
