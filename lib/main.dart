import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';
import 'configs/route/route.dart';
import 'configs/theme/theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.notification!.title}");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_cannel', 'high Importance Notification',
    importance: Importance.high, playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  String kkk = dotenv.get("base_url");
  debugPrint("base url $kkk");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (Platform.isIOS) {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  // String? token = await FirebaseMessaging.instance.getToken();
  // debugPrint(" your get token $token");
  if (messaging.isAutoInitEnabled) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("you have been get notification from firebase ");
      RemoteNotification? notification = message.notification;
      if (message.notification != null) {
        if (Platform.isAndroid) {
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.createNotificationChannel(channel);
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  icon: '@mipmap/ic_launcher',
                ),
                iOS: const DarwinNotificationDetails()),
          );
        }
      }
    });
  } else {
    debugPrint('User declined or has not accepted permission');
  }
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      theme: theme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
