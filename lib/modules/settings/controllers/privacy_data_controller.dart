import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';

class PrivacyDataController extends GetxController {
  final controller = Get.put(SettingController());
  void resetIndex() {
    controller.index.value = 0;
  }
}
