import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomTagCard extends StatelessWidget {
  final String title;
  final Function ontap;
  final bool isOnSearch;
  final bool isTheSame;
  const CustomTagCard({
    super.key,
    required this.title,
    this.isOnSearch = true,
    this.isTheSame = false,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOnSearch == true) {
          ontap();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
        decoration: BoxDecoration(
          color: isTheSame == true
              ? const Color.fromARGB(255, 11, 120, 150)
              : AppColor.secondnaryColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(5),
        ),
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
