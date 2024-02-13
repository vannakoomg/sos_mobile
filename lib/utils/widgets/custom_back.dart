import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

class CustomBack extends StatelessWidget {
  final Function? ontap;
  const CustomBack({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap == null
          ? () {
              debugPrint("sdfsd)sdfsd");
              unFocus(context);
              context.pop();
            }
          : () {
              ontap!();
            },
      child: Icon(
        Platform.isAndroid
            ? Icons.arrow_back_rounded
            : Icons.arrow_back_ios_new_rounded,
        color: Theme.of(context).colorScheme.tertiary,
        size: 26,
      ),
    );
  }
}
