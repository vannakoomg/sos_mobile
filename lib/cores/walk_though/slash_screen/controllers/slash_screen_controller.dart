import 'package:get/get.dart';

class SlashScreenController extends GetxController {
  static init() => Get.put(SlashScreenController());
  var isFetchStorgeLocal = true.obs;
  // var slashScreenModel = SlashScreenModel();
  var slashScreen = ''.obs;
  var slashScreenDataStorageLocal = [].obs;
}
