import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool disble;
  const CustomButtom(
      {super.key,
      required this.title,
      required this.onTap,
      this.disble = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disble == false ? onTap!() : null;
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: disble == false
                ? AppColor.buttonColor
                : AppColor.buttonColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(100)),
        height: 40,
        duration: const Duration(milliseconds: 300),
        child: Center(
            child: Text(
          "$title",
          style: Theme.of(context).textTheme.titleMedium,
        )),
      ),
    );
  }
}
