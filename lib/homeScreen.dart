import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sos_mobile/cores/setting/controller/setting_controller.dart';
import 'package:sos_mobile/utils/controller/language_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'package:sos_mobile/utils/helpers/language_singleeton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getIt<LanguageController>().fetchLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => getIt<LanguageController>().loadingFetchLanguage.value == true
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                        "${getIt<LanguageController>().loadingFetchLanguage.value}"),
                  ),
                ),
              )
            : Center(
                child: Text(
                  "${getIt<LanguageController>().loadingFetchLanguage.value}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
      ),
    );
  }
}
