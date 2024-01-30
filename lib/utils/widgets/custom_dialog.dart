import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

void customshowDialog(BuildContext context, String title) {
  showDialog<void>(
    barrierDismissible: false,
    useSafeArea: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          backgroundColor: AppColor.secondnaryColor,
          alignment: Alignment.center,
          title: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.background, fontSize: 22),
          )),
        ),
      );
    },
  );
}
