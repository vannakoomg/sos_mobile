import 'package:flutter/cupertino.dart';
import '../../../../../utils/helpers/api_base_helper/api_base_helper.dart';
import '../../../../../utils/helpers/conllection_controller.dart/collection_controller.dart';
import '../../presentation/logic/slash_screen_controller.dart';
import '../Model/slash_screen_model.dart';

class SlashScreenRepository {
  Future<String> fetchSlashScreen() async {
    await getIt<ApiBaseHelperGetConnect>().fetchData(url: 'slashscreen').then(
      (response) {
        getIt<SlashScreenController>().slashScreenModel =
            SlashScreenModel.fromJson(response);
      },
    ).onError((ErrorModelGetConnect error, stackTrace) {
      debugPrint("fetch slashscreen status code ${error.statusCode}");
    });
    return getIt<SlashScreenController>().slashScreenModel.title.toString();
  }
}
