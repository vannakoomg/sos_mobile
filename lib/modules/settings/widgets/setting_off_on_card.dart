import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class OffOnSettingCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  final int isShow;
  final String description;
  const OffOnSettingCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.ontap,
    required this.isShow,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onTertiary),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                ontap();
              },
              child: SizedBox(
                height: 35,
                width: 80,
                child: Stack(
                  children: [
                    Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isShow == 0
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.9)
                                  : AppColor.secondnaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Text(
                                subTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ))),
                    if (isShow == 0)
                      Center(
                        child: Transform(
                          transform: Matrix4.identity()..rotateZ(2.5),
                          alignment: Alignment.center,
                          child: Container(
                            height: 2,
                            width: 60,
                            color: AppColor.secondnaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColor.textThird),
              ),
            ),
            const SizedBox(
              width: 100,
            )
          ],
        )
      ],
    );
  }
}
