import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/notification/controllers/notification_controller.dart';
import 'package:sos_mobile/modules/notification/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: 40,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      if (i == 0)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text("សារជូនដំណឹង",
                              style: Theme.of(context).textTheme.titleLarge!
                              // .copyWith(color: AppColor.primaryColor),
                              ),
                        ),
                      NotificationCard(
                        notification: controller.notificationData[0],
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
