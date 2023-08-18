import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customshowDialog(context, String title) {
  Get.dialog(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Container(
          height: 90,
          width: 90,
          decoration:
              const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
          child: Center(
              child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.white),
          )),
        )),
      ),
      barrierColor: Colors.transparent);
}
