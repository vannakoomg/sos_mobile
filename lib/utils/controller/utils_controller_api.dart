import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'package:sos_mobile/utils/helpers/language_singleeton.dart';
import 'package:sos_mobile/utils/model/language_model/language_model.dart';

@injectable
class UtilsController {
  @factoryMethod
  static init() => Get.put(UtilsController());
  var loadingFetchLanguage = true.obs;
  Future fetchLanguage({String lang = "kh"}) async {
    await getIt<ApiBaseHelperGetConnect>()
        .fetchData(
      url: "language?lang=$lang",
    )
        .then((response) {
      loadingFetchLanguage(false);
      LanduageSingleton.instance.landuageModel =
          LanduageModel.fromJson(response);
    }).onError((ErrorModelGetConnect error, stackTrace) {
      loadingFetchLanguage(false);
      debugPrint("fetched language error status code ${error.statusCode}");
    });
  }
}
