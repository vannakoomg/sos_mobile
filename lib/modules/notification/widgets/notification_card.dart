// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

import '../models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel? notification;

  const NotificationCard({super.key, this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(children: [
          CustomCachedImageCircle(
            image: notification!.image ?? '',
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 0.5,
            ),
          ),
          const Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification!.name ?? '',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        notification!.time ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                Text(
                  notification!.title ?? '',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
