import 'package:flutter/material.dart';

Future customShowModalBottomSheet({
  required BuildContext context,
  required double height,
  required Widget widget,
}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: ((context) {
      return Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: widget,
      );
    }),
  );
}
