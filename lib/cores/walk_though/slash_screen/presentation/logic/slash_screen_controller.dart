import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/data/Model/slash_screen_model.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/data/repository/slash_screen_repository.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/domain/repository/slash_screen_base_repository.dart';

import '../../../../../utils/helpers/local_data/storge_local.dart';

SlashScreenRepository _slashScreenRepository = SlashScreenRepository();

@injectable
class SlashScreenController extends GetxController
    implements SlashScreenBaseRepository {
  @factoryMethod
  static init() => Get.put(SlashScreenController());
  var isFetchStorgeLocal = true.obs;
  var slashScreenModel = SlashScreenModel();
  var slashScreen = ''.obs;
  var slashScreenDataStorageLocal = [].obs;
  
  @override
  fetchSlashScreen() {
    // TODO: implement fetchSlashScreen
    throw UnimplementedError();
  }

 
    }
