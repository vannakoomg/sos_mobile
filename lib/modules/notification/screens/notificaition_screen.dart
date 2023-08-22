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
    return SafeArea(
      child: Container(
        color: AppColor.mainColor,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Column(children: [
          Text(
            "សារជូនដំណឹង",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppColor.primaryColor),
          ),
          const SizedBox(
            height: 10,
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
    );
  }
}
