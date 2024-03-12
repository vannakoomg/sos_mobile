import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../configs/route/route.dart';

Future checkForInitalMessge() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage().then((value) {
    if (value != null) {
      handleRoute(value);
    }
  });
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  handleRoute(message);
  debugPrint("Handling a background message: ${message.notification!.title}");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_cannel', 'high Importance Notification',
    importance: Importance.high, playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void listNotification(BuildContext context) async {
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
  try {
    String? token = await messaging.getToken();
    debugPrint("device token $token");
  } catch (e) {
    debugPrint("catch $e");
  }
  if (messaging.isAutoInitEnabled) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
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
              iOS: const DarwinNotificationDetails(),
            ),
          );
        }
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      debugPrint("tap on Notification  ${event.data["route"]}");
      handleRoute(event);
    });
    void notificationTapBackground(NotificationResponse notificationResponse) {
      router.pushNamed(
        'question-detail',
        pathParameters: {"id": "109"},
      );
    }

    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        router.pushNamed(
          'question-detail',
          pathParameters: {"id": "109"},
        );
      },
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

void handleRoute(RemoteMessage message) {
  // context.goNamed("setting");

  router.pushNamed(
    'question-detail',
    pathParameters: {"id": "109"},
  );
}
