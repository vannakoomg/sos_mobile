import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/helpers/api_base_helper/api_base_helper.dart';

class ListingController extends GetxController {
  var isLoding = false.obs;
  var cPage = 1.obs;
  var lPage = 2.obs;
  Future<void> getLising() async {
    isLoding(true);
    try {
      await ApiBaseHelper.obj
          .onNetworkRequesting(
              url:
                  'https://pre-rentkh.z1central.com/api/mobile/v2/properties?page=${cPage.value}',
              methode: METHODE.get,
              isAuthorize: false)
          .then((response) {
        if (cPage.value <= lPage.value) {
          response['data'].map((e) {}).toList();
          lPage.value = response['meta']['last_page'];
          cPage.value++;
        }
      }).onError((ErrorModel error, stackTrace) {
        // debugPrint('error : ${error.statusCode}');
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoding(false);
    }
  }
}
