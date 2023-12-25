import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/url.dart';
import 'package:sos_mobile/modules/search/model/popular_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class Searchcontroller extends GetxController {
  final isFocus = false.obs;
  final searchTextEditController = TextEditingController().obs;
  final searchText = ''.obs;
  final popular = PopularModel().obs;
  void delete() {
    // searchText.value = '';
    searchTextEditController.value = TextEditingController();
  }

  void deleteSaveSearch() {}
  void fetchPopular() async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
            url: "$baseUrl/v1/popular-search",
            methode: METHODE.get,
            isAuthorize: false)
        .then((value) {
      if (value['statusCode'] == 200) {
        debugPrint('data from api $value');
        popular.value = PopularModel.fromJson(value);
      } else {}
    }).onError((error, stackTrace) {
      debugPrint("error server");
    });
  }
}
