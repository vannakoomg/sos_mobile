import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/helpers/api_base_helper/api_base_helper.dart';
import '../../home/data/Model/property_data/property_data.dart';

class ListingController extends GetxController {
  var isLoding = false.obs;
  var listint = <PropertyModel>[].obs;
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
          response['data'].map((e) {
            listint.add(PropertyModel.fromJson(e));
          }).toList();
          debugPrint(listint.length.toString());
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
