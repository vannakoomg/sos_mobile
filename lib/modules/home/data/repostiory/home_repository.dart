import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/data/Model/property_data/property_data.dart';
import 'package:sos_mobile/modules/home/domain/home_base_repository.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

final con = Get.put(HomeContoller());

class HomeRepository extends GetxController implements HomeRepositoryBase {
  @override
  Future<void> getQuestion() async {
    con.isLoading.value = true;
    await ApiBaseHelper.obj
        .onNetworkRequesting(
            url: 'https://pre-rentkh.z1central.com/api/mobile/v2/properties?page=${con.currentPage.value}',
            methode: METHODE.get,
            isAuthorize: false)
        .then((response) {
      if (con.currentPage.value < con.lastPage.value) {
        response['data'].map((value) {
          con.listPropertyData.add(PropertyModel.fromJson(value));
        }).toList();
        con.lastPage.value = response['meta']['last_page'];
        con.currentPage.value++;
      }
      debugPrint("lekk${con.listPropertyData.length}");
    });
  }
}
