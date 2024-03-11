import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class OffOnSettingCard extends StatelessWidget {
  final String title;
  final Function ontap;
  final int isShow;
  final String description;
  const OffOnSettingCard({
    super.key,
    required this.title,
    required this.ontap,
    required this.isShow,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ],
            ),
          ),
          AnimatedContainer(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              height: 30,
              width: 45,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary, width: 0.5),
                borderRadius: BorderRadius.circular(20),
                color: isShow == 0
                    ? Theme.of(context).colorScheme.background
                    : AppColor.successColor,
              ),
              child: Center(
                child: Text(
                  isShow == 0 ? "បិទ" : "បើក",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              )),
        ],
      ),
    );
  }
}
