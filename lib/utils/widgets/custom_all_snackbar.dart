import 'package:flutter/material.dart';

import '../../configs/const/Colors/app_colors.dart';

class CustomAlertReponse {
  static showSuccess(
      {String? title, String? message, required BuildContext context}) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline_outlined,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                  if (message != null)
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.successColor,
        duration: const Duration(seconds: 3),
      ));
  }

  static showDanger(
      {String? title, String? message, required BuildContext context}) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.warning_amber_sharp,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  if (message != null)
                    Text(
                      message,
                      // 'Your account has been created',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.dangerColor,
        duration: const Duration(seconds: 3),
      ));
  }

  static showWarning(
      {String? title, String? message, required BuildContext context}) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.warning_amber_sharp,
              size: 25,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                  if (message != null)
                    Text(
                      message,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColor.warningColor,
        duration: const Duration(seconds: 3),
      ));
  }
}
