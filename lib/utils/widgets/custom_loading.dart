import 'package:flutter/material.dart';

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
              color: Theme.of(context).colorScheme.primary,
            ),
            shape: BoxShape.circle),
        child: Image.asset(
          "assets/image/loading.gif",
        ),
      ),
    );
  }
}
