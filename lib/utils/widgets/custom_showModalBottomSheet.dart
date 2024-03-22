// ignore_for_file: file_names

import 'package:flutter/material.dart';

Future customShowModalBottomSheet({
  required BuildContext context,
  required double height,
  required String title,
  required Function ontap,
  required List<String> list,
}) async {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: ((context) {
      return Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 22),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                height: 0.4,
                width: double.infinity,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: list.asMap().entries.map((e) {
                    return GestureDetector(
                      onTap: () {
                        ontap(e.key);
                      },
                      child: Container(
                        height: 40,
                        color: Colors.transparent,
                        child: Text(
                          e.value,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}
