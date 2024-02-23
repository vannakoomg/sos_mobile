import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool disble;
  final double fountSize;
  final double height;
  final double white;
  final Color colors;
  final Color borderColor;

  const CustomButtom({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 40,
    this.white = 80,
    this.colors = Colors.pink,
    this.borderColor = Colors.transparent,
    this.disble = false,
    this.fountSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disble == false ? onTap!() : null;
      },
      child: AnimatedContainer(
        width: white,
        decoration: BoxDecoration(
            color: disble == false ? colors : AppColor.textfourth,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: borderColor, width: 0.5)),
        height: height,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 150),
        child: Center(
          child: Text(
            "$title",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontSize: fountSize),
          ),
        ),
      ),
    );
  }
}
