import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

class CustomComfirmYesNo extends StatelessWidget {
  final Function ontapYes;
  final Function? ontapNo;
  final String title;
  final String subTitle;
  const CustomComfirmYesNo(
      {super.key,
      required this.title,
      this.subTitle = '',
      required this.ontapYes,
      this.ontapNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 180,
      decoration: BoxDecoration(
        color: AppColor.textfourth,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 18, color: AppColor.textThird),
            textAlign: TextAlign.center,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14, color: Theme.of(context).colorScheme.onSecondary),
          ),
          const Gap(10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CustomButtom(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              colors: AppColor.dangerColor,
              title: "No",
              onTap: () async {
                if (ontapNo == null) {
                  context.pop();
                } else {
                  ontapNo!();
                }
              },
            ),
            CustomButtom(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                title: "Yes",
                colors: AppColor.successColor,
                onTap: () async {
                  ontapYes();
                })
          ]),
        ],
      ),
    );
  }
}
