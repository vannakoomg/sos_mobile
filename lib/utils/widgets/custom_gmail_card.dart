import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../configs/const/Colors/app_colors.dart';

class CustomGmailCard extends StatelessWidget {
  final Function ontap;
  const CustomGmailCard({
    super.key,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        width: 160,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: AppColor.secondnaryColor,
          ),
          // color: AppColor.secondnaryColor,
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                "assets/icons/gmail.svg",
                height: 18,
                width: 18,
              ),
            ),
            const Gap(5),
            Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                "ភ្ជាប់ជាមួយ​ Google",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
