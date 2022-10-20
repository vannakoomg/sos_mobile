import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import '../../../cores/walk_though/slash_screen/slash_screen_model/slash_screen_model.dart';

@injectable
class UtilsControllerFunction extends GetxController {
  @factoryMethod
  static init() => Get.put(UtilsControllerFunction());
  var slashScreen = SlashScreenModel();
  var loadingFetchLanguage = true.obs;
}
