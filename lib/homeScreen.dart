import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/controller/utils_controller/utils_controller_api.dart';
import 'package:sos_mobile/utils/controller/utils_controller/utils_controller_function.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getIt<UtilsControllerApi>().fetchLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () =>
            getIt<UtilsControllerFunction>().loadingFetchLanguage.value == true
                ? Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                            "${getIt<UtilsControllerFunction>().loadingFetchLanguage.value}"),
                      ),
                    ),
                  )
                : Center(
                    child: Text(
                      "${getIt<UtilsControllerFunction>().loadingFetchLanguage.value}",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
      ),
    );
  }
}
