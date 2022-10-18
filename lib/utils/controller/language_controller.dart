import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/language_singleeton.dart';
import 'package:sos_mobile/utils/model/language_model/language_model.dart';

@injectable
class LanguageController extends GetxController {
  @factoryMethod
  static init() => Get.put(LanguageController());
  var loadingFetchLanguage = true.obs;
  var isLoding = 'test'.obs;
  final _apibaseHelper = ApiBaseHelperGetConnect();
  Future fetchLanguage({String lang = "kh"}) async {
    await _apibaseHelper
        .fetchData(
      url: "language?lang=$lang",
      isAuthorize: true,
    )
        .then((response) {
      debugPrint("you have fetched : $response");
      loadingFetchLanguage(false);
      debugPrint("loadingFetchLanguage : $loadingFetchLanguage");
      LanduageSingleton.instance.landuageModel =
          LanduageModel.fromJson(response);
    }).onError((ErrorModelGetConnect error, stackTrace) {
      loadingFetchLanguage(false);
      debugPrint("Error status code ${error.statusCode}");
    });
  }

  void changevalue() {
    loadingFetchLanguage.value = false;
    debugPrint("loadingFetchLanguage : ${loadingFetchLanguage.value}");
  }
}
