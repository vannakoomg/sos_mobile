import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/BottomNavigationBar/controller/bottom_navigation_bar.dart';
import 'package:sos_mobile/modules/search/model/popular_model.dart';
import 'package:sos_mobile/modules/search/model/recent_search_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class Searchcontroller extends GetxController {
  final bottomNavigetionController = Get.put(BottomNavigatonBarController());
  final isFocus = false.obs;
  final searchTextEditController = TextEditingController().obs;
  final searchText = ''.obs;
  final popular = PopularModel(data: []).obs;
  final recentSearch = RecentSearchModel(data: []).obs;
  final isloading = false.obs;
  void delete() {
    searchTextEditController.value = TextEditingController();
  }

  void fetchPopular() async {
    if (bottomNavigetionController.index.value == 0) {
      isloading.value = true;
      await ApiBaseHelper.apiBaseHelper
          .onNetworkRequesting(
        url: "/v1/popular-search",
        methode: METHODE.get,
        isAuthorize: false,
      )
          .then((value) {
        popular.value = PopularModel.fromJson(value);
        isloading.value = false;
      }).onError((error, stackTrace) {
        isloading.value = false;
        debugPrint("error server");
      });
    }
  }

  Future fetchRecentSeaarch() async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/recent_search",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      if (value["data"] != []) {
        recentSearch.value = RecentSearchModel.fromJson(value);
      }
    }).onError((error, stackTrace) {
      debugPrint("on cache $error");
    });
  }

  Future storeRecentSearch(String name) async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/recent_search",
      methode: METHODE.post,
      body: {"name": name},
      isAuthorize: true,
    )
        .then((value) {
      fetchRecentSeaarch();
      debugPrint("value $value");
    }).onError((error, stackTrace) {
      debugPrint("on cache $error");
    });
  }

  Future deleteRecentSearch(int id) async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/recent_search/delete/$id",
      methode: METHODE.post,
      isAuthorize: true,
    )
        .then((value) {
      fetchRecentSeaarch();
      debugPrint("valuesdfsdfs $value");
    }).onError((error, stackTrace) {
      debugPrint("on cache $error");
    });
  }

  Future deleteAll() async {
    await ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/recent_search/deleteAll",
      methode: METHODE.post,
      isAuthorize: true,
    )
        .then((value) {
      debugPrint("valuesdfsdfs $value");
    }).onError((error, stackTrace) {
      debugPrint("on cache $error");
    });
  }
}
