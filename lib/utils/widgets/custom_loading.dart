import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: AppColor.textfourth,
            ),
            shape: BoxShape.circle),
        child: Image.asset(
          "assets/image/loading.gif",
        ),
      ),
    );
  }
}
