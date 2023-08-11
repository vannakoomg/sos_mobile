import 'package:get/get.dart';
import 'package:sos_mobile/modules/notification/models/notification_model.dart';

class NotificationController extends GetxController {
  final notificationData = [
    NotificationModel(
      id: "1",
      image:
          "https://i.pinimg.com/originals/ae/14/3d/ae143d60cce8c9ff8f3801a80e433ea9.png",
      name: "បុផា",
      profileId: "",
      qusetionId: "12",
      time: "3day go",
      title: "Like your Anwser",
      type: "like",
    ),
    NotificationModel(
      id: "3",
      image:
          "https://play-lh.googleusercontent.com/MG6c3_Zf4q_KWonZp3K2GvWD338KzDzTH8DY-nS4-3G3rS6X7CbbLLNBMTolGVg8ju3F=w750-h750",
      name: "បុផា",
      profileId: "",
      qusetionId: "12",
      time: "3day go",
      title: "បានផ្ដល់ចម្លើយនៅសំនួររបស់អ្នក",
      type: "anwser",
    ),
  ];
}
