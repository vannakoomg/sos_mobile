import 'package:get/get.dart';

import '../../../models/setting_card_model.dart';

class SettingNotificationController extends GetxController {
  final notificationData = <SettingCardModel>[
    SettingCardModel(
      description: "Notification",
      subtitle: "On",
      title: "Like",
      columName: "notification",
    ),
    SettingCardModel(
      description: "Allow Notification Like",
      subtitle: "On",
      title: "Like",
      columName: "notification_like",
    ),
    SettingCardModel(
      description: "Allow every one see your count",
      subtitle: "On",
      title: "Comment",
      columName: "notification_comment",
    ),
    SettingCardModel(
      description: "Allow every one see your the Question You Answer ",
      subtitle: "on",
      title: "Answer",
      columName: "notification_answer",
    ),
    SettingCardModel(
      description: "Allow every one see your the Question You Ask ",
      subtitle: "Ask",
      title: "Conrrect Answer",
      columName: "notification_correct",
    ),
  ];
}
