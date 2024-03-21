import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomSnackBar {
  static success({
    required String? title,
    required BuildContext context,
    Widget icon = const Icon(
      Icons.done,
      color: Color(0xff386641),
    ),
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      backgroundColor: const Color.fromARGB(255, 194, 232, 206),
      borderColor: const Color(0xff386641),
      borderWidth: 0.3,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10),
      margin: const EdgeInsets.all(10),
      messageSize: 0,
      flushbarPosition: position,
      message: "0sdfsdfsdfsd",
      titleText: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            icon,
            const Gap(5),
            Expanded(
              child: Text(
                "$title",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xff386641),
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xff386641),
              ),
            )
          ],
        ),
      ),
      reverseAnimationCurve: Curves.easeInOut,
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static into({
    required String? title,
    required BuildContext context,
    Widget icon = const Icon(
      Icons.info_outlined,
      color: Color(0xff014f86),
    ),
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      backgroundColor: const Color.fromARGB(255, 184, 220, 255),
      borderColor: const Color(0xff014f86),
      borderWidth: 0.3,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10),
      margin: const EdgeInsets.all(10),
      messageSize: 0,
      flushbarPosition: position,
      message: "0sdfsdfsdfsd",
      titleText: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            icon,
            const Gap(5),
            Expanded(
              child: Text(
                "$title",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xff014f86),
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xff014f86),
              ),
            )
          ],
        ),
      ),
      reverseAnimationCurve: Curves.easeInOut,
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static danger({
    required String? title,
    required BuildContext context,
    Widget icon = const Icon(
      Icons.dangerous_rounded,
      color: Color(0xffcc444b),
    ),
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      backgroundColor: const Color.fromARGB(255, 255, 141, 139),
      borderColor: const Color(0xffcc444b),
      borderWidth: 0.3,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10),
      margin: const EdgeInsets.all(10),
      messageSize: 0,
      flushbarPosition: position,
      message: "0sdfsdfsdfsd",
      titleText: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            icon,
            const Gap(5),
            Expanded(
              child: Text(
                "$title",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xffcc444b),
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xffcc444b),
              ),
            )
          ],
        ),
      ),
      reverseAnimationCurve: Curves.easeInOut,
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  static warning({
    required String? title,
    required BuildContext context,
    Widget icon = const Icon(
      Icons.warning_amber_rounded,
      color: Color(0xffdb7c26),
    ),
    FlushbarPosition position = FlushbarPosition.TOP,
  }) {
    return Flushbar(
      backgroundColor: const Color.fromARGB(255, 255, 228, 195),
      borderColor: const Color(0xffdb7c26),
      borderWidth: 0.3,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10),
      margin: const EdgeInsets.all(10),
      messageSize: 0,
      flushbarPosition: position,
      message: "0sdfsdfsdfsd",
      titleText: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            icon,
            const Gap(5),
            Expanded(
              child: Text(
                "$title",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: const Color(0xffdb7c26),
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xffdb7c26),
              ),
            )
          ],
        ),
      ),
      reverseAnimationCurve: Curves.easeInOut,
      borderRadius: BorderRadius.circular(10),
      duration: const Duration(seconds: 2),
    ).show(context);
  }
}
