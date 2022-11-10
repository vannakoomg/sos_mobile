import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/data/Model/slash_screen_model.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/data/repository/slash_screen_repository.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/domain/slash_screen_base_repository.dart';

SlashScreenRepository _slashScreenRepository = SlashScreenRepository();

@injectable
class SlashScreenController extends GetxController
    implements SlashScreenBaseRepository {
  @factoryMethod
  static init() => Get.put(SlashScreenController());
  var slashScreenModel = SlashScreenModel();
  var slashScreen = ''.obs;
  var slashScreenDataStorageLocal = <String>[].obs;
  var title = ''.obs;
  @override
  Future<String> fetchSlashScreen() async {
    slashScreen.value = await _slashScreenRepository.fetchSlashScreen();
    return slashScreen.value;
  }

  Future storageDataLocal() async {}
}
