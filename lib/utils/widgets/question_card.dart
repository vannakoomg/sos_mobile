import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final String description;
  final List image;
  final String answer;
  final String votes;
  const QuestionCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.answer,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.mainColor),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              border: Border.all(
                color: AppColor.backgroundColor,
              ),
            ),
            child: Text(title),
          ),
          if (image.isNotEmpty)
            Container(
              child: Row(children: []),
            )
        ],
      ),
    );
  }
}
