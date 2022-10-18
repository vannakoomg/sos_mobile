import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'configs/route/route.dart';
import 'configs/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset('app_settings');
  declareController();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      theme: theme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
