import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/search/model/result_search_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class ResultSearchController extends GetxController {
  final isloading = false.obs;
  final resultSearchModel = ResultSearchModel().obs;
  final resultSearch = <ResultSearch>[].obs;
  Future fetchResultSearch(String q, int page) async {
    isloading.value = true;
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/question/search?q=$q&page=$page",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      isloading.value = false;
      resultSearchModel.value = ResultSearchModel.fromJson(value);
      resultSearch.addAll(resultSearchModel.value.data!);
    }).onError((error, stackTrace) {
      debugPrint("on errordssdfsfsds ");
      isloading.value = false;
    });
  }
}
