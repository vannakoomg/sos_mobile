import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/notification/controllers/notification_controller.dart';
import 'package:sos_mobile/modules/notification/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: AppColor.mainColor,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(children: [
              Text(
                "Notification",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 40,
              itemBuilder: (context, i) {
                return NotificationCard(
                  notification: controller.notificationData[0],
                );
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
