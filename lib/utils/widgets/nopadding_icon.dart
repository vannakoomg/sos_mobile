import 'package:flutter/material.dart';

class NoPaddingIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const NoPaddingIcon({
    Key? key,
    required this.icon,
    this.size = 24.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
    );
  }
}
