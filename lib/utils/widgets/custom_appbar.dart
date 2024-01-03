import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.orange,
      alignment: Alignment.center,
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
