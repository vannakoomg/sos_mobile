import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/controllers/setting_controller.dart';

class ThemeController extends GetxController {
  final controller = Get.put(SettingController());
  final fountSize = 0.0.obs;
  void resetIndex() {
    controller.index.value = 0;
  }
}
