import 'package:flutter/material.dart';

class CustomEmptyData extends StatelessWidget {
  const CustomEmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "គ្មានទិន្នន័យ",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
