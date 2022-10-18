import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:sos_mobile/homeScreen.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';

import 'configs/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset('app_settings');
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
