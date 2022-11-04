import 'package:get/get.dart';
import 'package:sos_mobile/modules/profile/data/repository/profile_repostiory.dart';
import 'package:sos_mobile/modules/profile/domain/repository/profile_base_repository.dart';

class ProfileController extends GetxController
    implements ProfileBaseRepository {
  ProfileRepository obj = Get.put(ProfileRepository());
  var x = 0.obs;
  @override
  getProfile() {
    x.value = obj.getProfilefromApi();
  }
}
