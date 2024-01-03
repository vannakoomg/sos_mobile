import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomTagCard extends StatelessWidget {
  final String title;
  final Function ontap;
  final bool isOnSearch;
  const CustomTagCard(
      {super.key,
      required this.title,
      this.isOnSearch = true,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOnSearch == true) {
          ontap();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5, top: 5),
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
        decoration: BoxDecoration(
            color: AppColor.secondnaryColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(8)),
        child: isOnSearch == true
            ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              )
            : Wrap(children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    ontap();
                  },
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.close,
                      weight: 500,
                      size: 12,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                )
              ]),
      ),
    );
  }
}
