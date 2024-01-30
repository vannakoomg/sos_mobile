import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

class CustomBack extends StatelessWidget {
  final Function? ontap;
  const CustomBack({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: ontap == null
            ? () {
                unFocus(context);
                router.pop();
              }
            : () {
                ontap!();
              },
        icon: Icon(
          Platform.isAndroid
              ? Icons.arrow_back_rounded
              : Icons.arrow_back_ios_new_rounded,
          color: Theme.of(context).colorScheme.primary,
          size: 26,
        ));
  }
}
