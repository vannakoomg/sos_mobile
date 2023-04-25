import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  Function? onTap;

  CustomButtom({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!(),
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(100)),
        height: 50,
        duration: const Duration(milliseconds: 300),
        child: Center(child: Text("$title")),
      ),
    );
  }
}
