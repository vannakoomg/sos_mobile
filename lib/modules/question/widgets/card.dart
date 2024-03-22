import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../configs/const/Colors/app_colors.dart';
import '../../../utils/widgets/custom_cache_image_cricle.dart';

class CardQuestion extends StatelessWidget {
  final String title;
  final String description;
  final String name;
  final String time;
  final String image;
  final String avarta;
  final Function ontapMore;
  final Function ontapProfile;
  const CardQuestion({
    super.key,
    required this.title,
    required this.description,
    required this.name,
    required this.time,
    required this.image,
    required this.avarta,
    required this.ontapMore,
    required this.ontapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Stack(
            children: [
              if (image != '')
                CustomCachedImageCircle(
                  width: double.infinity,
                  borderRadius: BorderRadius.zero,
                  height: 300,
                  image: image,
                ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: image == ""
                                ? Colors.transparent
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ontapMore();
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: image == ""
                                ? Colors.transparent
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.more_horiz_rounded,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                    ),
                  ]),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ontapProfile();
                      },
                      child: const CustomCachedImageCircle(
                        image:
                            "https://webneel.com/daily/sites/default/files/images/daily/08-2018/1-nature-photography-spring-season-mumtazshamsee.jpg",
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "វណ្ណះ",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "2 day",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColor.textThird, fontSize: 9),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(10),
                Text(
                  "ហេតុអ្វីបានជាទំស្រលាញ់ទាវ ?",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                if (description != '')
                  Text(
                    "ថ្ងៃសៅរ៍ ទី១៧ ខែកុម្lsdlfadsdkfkdslksdlkdsalkdsaldsalalsksadkdskdsaksadlksdkkdskdsalkdsakdsaksadldsaldsaslfsadlkadslsafdlksdlkflssdlkfdsalklkdsaldsadsalkdslkmភៈ ឆ្នាំ២០១៨។អត្ថប-ShareAlike Lice",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColor.textThird,
                        ),
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
            // child: Center(
            //   child: Container(
            //     width: double.infinity,
            //     // height: 0.5,
            //     color: Theme.of(context).colorScheme.onPrimary,
            //   ),
            // ),
          )
        ],
      ),
    );
  }
}
