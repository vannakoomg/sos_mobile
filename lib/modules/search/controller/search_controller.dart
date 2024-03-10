import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/BottomNavigationBar/controller/bottom_navigation_bar.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/search/controller/recent_search_controller.dart';
import 'package:sos_mobile/modules/search/model/popular_model.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

class Searchcontroller extends GetxController {
  final bottomNavigetionController = Get.put(BottomNavigatonBarController());
  final homeControlle = Get.put(HomeContoller());
  final isFocus = false.obs;
  final popular = PopularModel(data: []).obs;
  final isloading = false.obs;

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

  final recentSearchController = Get.put(RecentSearchController());
  void tapSearch({
    required BuildContext context,
    required int type,
    required String name,
  }) {
    homeControlle.clearSearch();
    context.pushNamed("/result-search", pathParameters: {"text": name});
    recentSearchController.insertRecentSearch(name, type);
  }
}
