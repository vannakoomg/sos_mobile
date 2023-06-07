import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class CustomCommentCrad extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  const CustomCommentCrad(
      {super.key, required this.name, required this.time, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                  color: Colors.blue, fontStyle: FontStyle.normal),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(time),
          ],
        ),
        const SizedBox(
          height: 1,
        ),
        Text(title)
      ]),
    );
  }
}
