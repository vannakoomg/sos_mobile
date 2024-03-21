import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../configs/const/Colors/app_colors.dart';
import '../../../configs/route/route.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              router.goNamed('setting');
            },
            child: Container(
              color: Colors.transparent,
              height: 35,
              width: 35,
              child: Center(
                child: Icon(
                  Icons.settings_rounded,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 23,
                ),
              ),
            ),
          ),
        ),
        const Gap(10),
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.secondnaryColor,
              ),
            ),
          ),
          const Gap(10),
          Text(
            "វណ្ណះ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(10),
          Text(
            "ខ្មែរស្រលាញ់ខ្មែរ",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.textThird),
          ),
          const Gap(20),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("23",
                          style: Theme.of(context).textTheme.titleMedium!),
                      Text("ឆ្លើយ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.textThird)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("3",
                          style: Theme.of(context).textTheme.titleMedium!),
                      Text("សំនួរ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.textThird))
                    ],
                  ),
                  Column(
                    children: [
                      Text("43",
                          style: Theme.of(context).textTheme.titleMedium!),
                      Text("ចូលចិត្ត",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.textThird))
                    ],
                  ),
                  Column(
                    children: [
                      Text("4",
                          style: Theme.of(context).textTheme.titleMedium!),
                      Text("ចម្លើយត្រូវ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColor.textThird))
                    ],
                  )
                ]),
          ),
        ]),
      ],
    );
  }
}
