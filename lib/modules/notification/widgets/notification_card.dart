// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

import '../models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel? notification;

  const NotificationCard({super.key, this.notification});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(children: [
          Container(
              height: 40,
              width: 40,
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                imageUrl: notification!.image ?? '',
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification!.name ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
