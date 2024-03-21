import 'dart:io';

import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String title;
  final bool? isClose;
  final Function? ontap;
  const CustomAppBarWidget(
      {super.key,
      required this.title,
      this.isClose = false,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              child: IconButton(
            onPressed: () {
              ontap!();
            },
            icon: isClose == false
                ? const Icon(
                    Icons.close_rounded,
                  )
                : Icon(
                    Platform.isAndroid
                        ? Icons.arrow_back_rounded
                        : Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
          )),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
    );
  }
}
