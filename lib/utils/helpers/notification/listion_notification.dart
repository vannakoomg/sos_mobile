import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../configs/route/route.dart';
import '../../controllers/singleton.dart';
import '../local_data/storge_local.dart';

Future checkForInitalMessge() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage().then((value) {
    if (value != null) {
      handleRoute(value);
    }
  });
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_cannel', 'high Importance Notification',
    importance: Importance.high, playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void listNotification() async {
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
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  String? token = await messaging.getToken();
  debugPrint("device token $token");

  if (messaging.isAutoInitEnabled) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      addtNotification();
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
                importance: Importance.high,
              ),
              iOS: const DarwinNotificationDetails(),
            ),
          );
        }

        await flutterLocalNotificationsPlugin.initialize(
          const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings(),
          ),
          onDidReceiveNotificationResponse:
              (NotificationResponse notificationResponse) {
            debugPrint("tap on notification $message");
            handleRoute(message);
          },
        );
      }
    });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   handleRoute(message);
    // });
    FirebaseMessaging.onBackgroundMessage((message) async {
      debugPrint("88888888888");
      handleRoute(message);
    });
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

void handleRoute(RemoteMessage message) {
  router.pushNamed(
    'question-detail',
    pathParameters: {"id": "109"},
  );
}

void addtNotification() async {
  try {
    int number = 0;
    await LocalStorage.getIntValue(key: 'numberNotificaiton').then((value) {
      number = value;
    });
    await LocalStorage.storeData(key: 'numberNotificaiton', value: number + 1);
    Singleton.obj.numberNotification.value =
        await LocalStorage.getIntValue(key: 'numberNotificaiton');
  } catch (e) {
    debugPrint("catch $e");
  }
}

void subtractNotification() async {
  int number = 0;
  await LocalStorage.getIntValue(key: 'numberNotificaiton').then((value) {
    number = value;
    debugPrint("number $number");
  });
  await LocalStorage.storeData(key: 'numberNotificaiton', value: number - 1);
  Singleton.obj.numberNotification.value =
      await LocalStorage.getIntValue(key: 'numberNotificaiton');
}

void countNotification() async {
  Singleton.obj.numberNotification.value =
      await LocalStorage.getIntValue(key: 'numberNotificaiton');
  debugPrint("------ ${Singleton.obj.numberNotification.value}");
}
