import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool disble;
  final double fountSize;
  final double height;
  final Color colors;
  const CustomButtom({
    super.key,
    required this.title,
    required this.onTap,
    this.height = 45,
    this.colors = Colors.pink,
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          color: disble == false ? colors : AppColor.mainColor,
          borderRadius: BorderRadius.circular(100),
        ),
        height: height,
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        child: Center(
          child: Text(
            "$title",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white, fontSize: fountSize),
          ),
        ),
      ),
    );
  }
}
