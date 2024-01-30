import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/search/model/popular_model.dart';

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
    // await ApiBaseHelper.apiBaseHelper
    //     .onNetworkRequesting(
    //         url: "/v1/popular-search", methode: METHODE.get, isAuthorize: false)
    //     .then((value) {
    //   debugPrint('data from api $value');
    //   popular.value = PopularModel.fromJson(value);
    // }).onError((error, stackTrace) {
    //   debugPrint("error server");
    // });
  }
}
