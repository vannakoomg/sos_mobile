import 'package:get/get.dart';
import 'package:sos_mobile/configs/theme/theme.dart';

class ThemeContro extends GetxController {
  final theme = darkMode.obs;
  void changeTheme() {
    if (theme.value == lightMode) {
      theme.value = darkMode;
    } else {
      theme.value = lightMode;
    }
  }
}
