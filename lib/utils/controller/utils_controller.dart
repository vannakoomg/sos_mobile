import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:sos_mobile/cores/walk_though/slash_screen/slash_screen_model/slash_screen_model.dart';
import 'package:sos_mobile/interface/interface_utils_controller.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/helpers/language_singleeton.dart';
import 'package:sos_mobile/utils/model/language_model/language_model.dart';

@injectable
class UtilsController extends GetxController
    implements InterfaceUtilsController {
  @factoryMethod
  static init() => Get.put(UtilsController());
  final _apibaseHelper = ApiBaseHelperGetConnect();
  var slashScreen = SlashScreenModel();
  var loadingFetchLanguage = true.obs;

  @override
  void fetchLanguage({String lang = "en"}) async {
    await _apibaseHelper
        .fetchData(
      url: "language?lang=$lang",
    )
        .then((response) {
      debugPrint("languages have been fetched : $response");
      loadingFetchLanguage(false);
      LanduageSingleton.instance.landuageModel =
          LanduageModel.fromJson(response);
    }).onError((ErrorModelGetConnect error, stackTrace) {
      loadingFetchLanguage(false);
      debugPrint("fetched language error status code ${error.statusCode}");
    });
  }

  @override
  void fetchSlashScreen() async {
    await _apibaseHelper.fetchData(url: 'slashscreen').then(
      (response) {
        slashScreen = SlashScreenModel.fromJson(response);
        debugPrint("slashscreen have been fetched : ${slashScreen.title}");
      },
    ).onError((ErrorModelGetConnect error, stackTrace) {
      debugPrint("fetch slashscreen status code ${error.statusCode}");
    });
  }
}
