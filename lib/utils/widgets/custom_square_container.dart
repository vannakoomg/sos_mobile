import 'package:flutter/material.dart';

class DynamicSquareContainer extends StatelessWidget {
  final bool select;
  final Function ontap;
  final String text;
  final Color colors;

  const DynamicSquareContainer({
    Key? key,
    required this.text,
    required this.colors,
    required this.select,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerSize = text.length * 20.0;
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: containerSize,
        height: containerSize,
        padding: const EdgeInsets.only(left: 2, right: 2),
        decoration: BoxDecoration(
          color: select ? colors : colors.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
