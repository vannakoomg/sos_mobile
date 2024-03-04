import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

class CustomOops extends StatelessWidget {
  final Function ontap;
  const CustomOops({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "OOPS !",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 26, color: Theme.of(context).colorScheme.onPrimary),
        ),
        const Gap(10),
        Text(
          "Something went worng please",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSecondary),
        ),
        const Gap(10),
        // TextButton(
        //     onPressed: () {
        //       ontap();
        //     },
        //     child: const Text("try again!"))
        CustomButtom(
            colors: AppColor.secondnaryColor.withOpacity(0.6),
            height: 35,
            white: 120,
            fountSize: 16,
            title: "TRY AGAIN !",
            onTap: () {
              ontap();
            })
      ],
    );
  }
}
