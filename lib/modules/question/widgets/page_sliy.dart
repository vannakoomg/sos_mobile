import 'package:flutter/material.dart';

import '../../../configs/const/Colors/app_colors.dart';

class PageSliy extends StatelessWidget {
  final Function ontap;
  final bool isAnswer;
  const PageSliy({super.key, required this.ontap, required this.isAnswer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Stack(
        children: [
          Container(
            height: 35,
            width: 110,
            decoration: BoxDecoration(
              // color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.secondnaryColor),
            ),
          ),
          AnimatedPositioned(
            top: 2.5,
            left: isAnswer == true ? 2 : 67,
            duration: const Duration(milliseconds: 250),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 30,
              width: isAnswer == true ? 60 : 40,
              decoration: BoxDecoration(
                color: AppColor.secondnaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            height: 35,
            width: 110,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "ចម្លើយ",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
                Text(
                  "មតិ",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
