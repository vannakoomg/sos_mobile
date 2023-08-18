import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomCommentCrad extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  final Function ontap;
  const CustomCommentCrad(
      {super.key,
      required this.name,
      required this.time,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                ontap();
              },
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
            ),
            const Spacer(),
            Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.black.withOpacity(0.7)),
            ),
          ],
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black.withOpacity(0.9)),
        ),
      ]),
    );
  }
}
