import 'package:get/get.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/data/Model/slash_screen_model.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/domain/repository/slash_screen_base_repository.dart';




class SlashScreenController extends GetxController
    implements SlashScreenBaseRepository {
  static init() => Get.put(SlashScreenController());
  var isFetchStorgeLocal = true.obs;
  var slashScreenModel = SlashScreenModel();
  var slashScreen = ''.obs;
  var slashScreenDataStorageLocal = [].obs;
  
  @override
  fetchSlashScreen() {
    throw UnimplementedError();
  }

 
    }
