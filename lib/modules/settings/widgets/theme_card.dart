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
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white.withOpacity(0.9)),
        ),
        const Spacer(),
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
                          borderRadius: BorderRadius.circular(20),
                          color: !isTure
                              ? Colors.white.withOpacity(0.9)
                              : AppColor.successColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 5, bottom: 5),
                          child: Text(subtilte),
                        ))),
                if (!isTure)
                  Center(
                    child: Transform(
                      transform: Matrix4.identity()..rotateZ(2.5),
                      alignment: Alignment.center,
                      child: Container(
                        height: 2,
                        width: 60,
                        color: Colors.red.withOpacity(0.8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
