import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            // color: AppColor.secondnaryColor.withOpacity(0.3),
            shape: BoxShape.circle),
        child: Image.asset(
          "assets/image/loading.gif",
          // color: Colors.black,
        ),
      ),
    );
  }
}
