import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomCommentCrad extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  final String countLike;
  final Function ontapProfile;
  final Function ontapLike;
  final Function ontapMore;

  const CustomCommentCrad({
    super.key,
    required this.name,
    required this.countLike,
    required this.time,
    required this.title,
    required this.ontapProfile,
    required this.ontapLike,
    required this.ontapMore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 10,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ontapProfile();
                    },
                    child: Text(name,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColor.secondnaryColor,
                            )),
                  ),
                  const Gap(5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.textfourth, fontSize: 9),
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.textThird),
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
              ),
              const Gap(10),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8),
          height: 30,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 0.5,
          ))),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  ontapLike();
                },
                child: Row(
                  children: [
                    Text(
                      countLike,
                      style: Theme.of(context).textTheme.bodyMedium!,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      "assets/icons/favorite.svg",
                      height: 15,
                      width: 15,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  ontapMore();
                },
                child: Container(
                  child: const Icon(
                    Icons.more_vert_rounded,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
