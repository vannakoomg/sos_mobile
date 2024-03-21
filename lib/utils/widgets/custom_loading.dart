import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          border: Border.all(
            width: 0.5,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
          shape: BoxShape.circle),
      child: Center(
        child: Image.asset(
          "assets/image/loading.gif",
          height: 45,
          width: 45,
        ),
      ),
    );
  }
}
