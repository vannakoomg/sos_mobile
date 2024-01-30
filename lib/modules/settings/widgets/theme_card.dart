import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class ThemeCard extends StatelessWidget {
  final String title;
  final String subtilte;
  final Function ontap;
  final bool isTure;
  const ThemeCard({
    super.key,
    required this.title,
    required this.subtilte,
    required this.ontap,
    required this.isTure,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
        GestureDetector(
          onTap: () {
            ontap();
          },
          child: SizedBox(
            height: 40,
            width: 60,
            child: Stack(
              children: [
                Center(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.primaryColor, width: 0.5),
                          borderRadius: BorderRadius.circular(20),
                          color: !isTure ? Colors.black : AppColor.successColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Text(
                            subtilte,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: AppColor.primaryColor, fontSize: 12),
                          ),
                        ))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
