import 'package:get/get.dart';
import 'package:sos_mobile/configs/theme/theme.dart';

class ThemeController extends GetxController {
  final theme = lightMode.obs;
  void changeTheme() {
    if (theme.value == lightMode) {
      theme.value = darkMode;
    } else {
      theme.value = lightMode;
    }
  }
}
