import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class OptionsSearch extends StatelessWidget {
  final Function ontapParagram;
  final Function ontapTag;
  const OptionsSearch(
      {super.key, required this.ontapParagram, required this.ontapTag});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: () {
          ontapParagram();
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondnaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          height: 25,
          child: Center(
            child: Text(
              "ដោយអត្តបទ",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      const Gap(8),
      GestureDetector(
        onTap: () {
          ontapTag();
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.secondnaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          height: 25,
          child: Center(
            child: Text(
              "ដោយពាក្យសម្គាល់",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      )
    ]);
  }
}
