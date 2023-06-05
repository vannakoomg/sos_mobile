import 'package:flutter/material.dart';

class CustomTapCard extends StatelessWidget {
  final String title;
  const CustomTapCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xffa9def9),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 11),
      ),
    );
  }
}
