import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool disble;
  final double fountSize;
  final double height;
  final Color colors;
  final Color borderColor;
  final EdgeInsets? padding;
  const CustomButtom({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 40,
    this.colors = Colors.pink,
    this.borderColor = Colors.transparent,
    this.padding,
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
        padding: padding ??
            const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 5),
        decoration: BoxDecoration(
            color: disble == false ? colors : AppColor.textfourth,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: borderColor)),
        height: height,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        child: Text(
          "$title",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white, fontSize: fountSize),
        ),
      ),
    );
  }
}
