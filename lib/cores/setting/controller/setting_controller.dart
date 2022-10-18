import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingController extends GetxController {
  static init() => Get.put(SettingController());
  final i = ''.obs;
}
// SettingController=>SettingController()