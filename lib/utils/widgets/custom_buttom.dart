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
  final bool outline;

  const CustomButtom({
    super.key,
    required this.title,
    required this.onTap,
    this.outline = false,
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
          color: outline == false
              ? disble == false
                  ? colors
                  : Theme.of(context).colorScheme.onSecondary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: outline == false
              ? const Border()
              : Border.all(
                  color: Theme.of(context).colorScheme.onSecondary,
                  width: 1,
                ),
        ),
        height: height,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 150),
        child: Center(
          child: Text(
            "$title",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color:
                    outline == false ? Colors.white : AppColor.secondnaryColor,
                fontSize: fountSize),
          ),
        ),
      ),
    );
  }
}
