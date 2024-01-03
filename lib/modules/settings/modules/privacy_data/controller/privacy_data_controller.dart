import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';
import 'package:sos_mobile/modules/settings/models/setting_card_model.dart';

class PrivacyDataController extends GetxController {
  final controller = Get.put(SettingController());
  final privacyData = <SettingCardModel>[
    SettingCardModel(
      description:
          "Allow every one see your profile photo and everything you ask post",
      subtitle: "Public",
      title: "Account",
      columName: "private_account",
    ),
    SettingCardModel(
      description: "Allow every one see your count",
      subtitle: "On",
      title: "CSCC",
      columName: "show_aacl",
    ),
    SettingCardModel(
      description: "Allow every one see your the Question You Answer ",
      subtitle: "on",
      title: "Answer",
      columName: "show_answer",
    ),
    SettingCardModel(
      description: "Allow every one see your the Question You Ask ",
      subtitle: "Ask",
      title: "On",
      columName: "show_question",
    ),
  ];

  void resetIndex() {
    controller.index.value = -1;
  }
}
