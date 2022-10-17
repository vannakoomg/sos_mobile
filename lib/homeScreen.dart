import 'package:flutter/material.dart';
import 'package:sos_mobile/modules/setting/controller/setting_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "${getIt<SettingController>().i}",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
