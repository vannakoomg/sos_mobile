import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool disble;
  const CustomButtom({super.key, this.title, this.onTap, this.disble = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disble == false ? onTap!() : null;
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
            color: disble == false ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(100)),
        height: 50,
        duration: const Duration(milliseconds: 300),
        child: Center(child: Text("$title")),
      ),
    );
  }
}
