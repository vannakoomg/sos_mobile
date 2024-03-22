// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';
import 'package:sos_mobile/utils/helpers/notification/listion_notification.dart';
import 'package:sos_mobile/utils/helpers/sqlife/db_helper.dart';
import 'configs/route/route.dart';
import 'modules/settings/modules/theme/controller/theme_controller.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (message.notification != null) {
    WidgetsFlutterBinding.ensureInitialized();
    await LocalStorage.init();
    await Firebase.initializeApp();
    debugPrint(
        "Handling a background mdfdsfsdfdsfdsessage: ${message.messageId}");
    FirebaseMessaging.onMessageOpenedApp.listen(
      (event) {
        debugPrint("--------------");
      },
    );
    addtNotification();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  DBHelper.obj.databaseObj = await DBHelper.obj.initDB();
  await dotenv.load(fileName: ".env");
  listNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    final themeController = Get.put(ThemeController());
    return GestureDetector(
        onTap: () {
          unFocus(context);
        },
        child: Obx(
          () => GetMaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            theme: themeController.theme.value,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return MediaQuery.withClampedTextScaling(
                minScaleFactor: 1,
                maxScaleFactor: 2.0,
                child: Obx(
                  () => Stack(
                    children: [
                      child!,
                      if (controller.isLongPress.value == true)
                        Scaffold(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          body: Stack(
                            children: [
                              Positioned(
                                  top: controller.dy.value,
                                  left: controller.dx.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 0.5,
                                            color: AppColor.secondnaryColor
                                                .withOpacity(0.5))),
                                    height: 50,
                                    width: 50,
                                  )),
                              Positioned(
                                left: controller.isOnleft.value ? null : 10,
                                right: controller.isOnleft.value ? 10 : null,
                                top: controller.dy.value > 200
                                    ? controller.dy.value - 130
                                    : controller.dy.value + 40,
                                child: Text(
                                  controller.action.value == 1
                                      ? "ពេញចិត្ត"
                                      : controller.action.value == 2
                                          ? "រក្សាទុក"
                                          : controller.action.value == 3
                                              ? "ចែករំលែក"
                                              : controller.action.value == 4
                                                  ? "ព្រមាន"
                                                  : "",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              AnimatedPositioned(
                                left: controller.afterLongPress.value
                                    ? controller.isPress01.value
                                        ? controller.dx.value -
                                            (controller.isOnleft.value
                                                ? 15
                                                : -5)
                                        : controller.dx.value -
                                            (controller.isOnleft.value
                                                ? 10
                                                : -10)
                                    : controller.dx.value + 5,
                                top: controller.afterLongPress.value
                                    ? controller.isPress01.value
                                        ? controller.dy.value - 99
                                        : controller.dy.value - 75
                                    : controller.dy.value + 5,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOutQuint,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: controller.isPress01.value ? 57 : 45,
                                  width: controller.isPress01.value ? 57 : 45,
                                  decoration: BoxDecoration(
                                    color: controller.isPress01.value
                                        ? AppColor.secondnaryColor
                                        : AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.favorite,
                                      color: AppColor.mainColor),
                                ),
                              ),
                              AnimatedPositioned(
                                left: controller.afterLongPress.value
                                    ? controller.isPress02.value
                                        ? controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 45
                                                : -50)
                                        : controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 40
                                                : -40)
                                    : controller.dx.value + 5,
                                top: controller.afterLongPress.value
                                    ? controller.isPress02.value
                                        ? controller.dy.value - 90
                                        : controller.dy.value - 70
                                    : controller.dy.value + 7,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOutQuint,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 250),
                                  height: controller.isPress02.value ? 57 : 45,
                                  width: controller.isPress02.value ? 57 : 45,
                                  decoration: BoxDecoration(
                                    color: controller.isPress02.value
                                        ? AppColor.secondnaryColor
                                        : AppColor.primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Icon(Icons.save_alt_outlined,
                                          color: AppColor.mainColor)),
                                ),
                              ),
                              AnimatedPositioned(
                                left: controller.afterLongPress.value
                                    ? controller.isPress03.value
                                        ? controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 85
                                                : -95)
                                        : controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 70
                                                : -75)
                                    : controller.dx.value,
                                top: controller.afterLongPress.value
                                    ? controller.isPress03.value
                                        ? controller.dy.value - 50
                                        : controller.dy.value -
                                            (controller.isOnleft.value
                                                ? 40
                                                : 37.5)
                                    : controller.dy.value,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOutQuint,
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      height:
                                          controller.isPress03.value ? 57 : 45,
                                      width:
                                          controller.isPress03.value ? 57 : 45,
                                      decoration: BoxDecoration(
                                        color: controller.isPress03.value
                                            ? AppColor.secondnaryColor
                                            : AppColor.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Icon(Icons.send,
                                              color: AppColor.mainColor)),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                left: controller.afterLongPress.value
                                    ? controller.isPress04.value
                                        ? controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 100
                                                : -100)
                                        : controller.dx.value +
                                            (controller.isOnleft.value
                                                ? 75
                                                : -75)
                                    : controller.dx.value,
                                top: controller.afterLongPress.value
                                    ? controller.isPress04.value
                                        ? controller.dy.value + 10
                                        : controller.dy.value + 10
                                    : controller.dy.value,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeInOutQuint,
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      height:
                                          controller.isPress04.value ? 57 : 45,
                                      width:
                                          controller.isPress04.value ? 57 : 45,
                                      decoration: BoxDecoration(
                                        color: controller.isPress04.value
                                            ? AppColor.secondnaryColor
                                            : AppColor.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                          child: Icon(Icons.report,
                                              color: AppColor.mainColor)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Stack(
                          children: controller.listLike.map((element) {
                            return Positioned(
                              top: element.dy,
                              left: element.dx,
                              child: Transform.rotate(
                                angle: element.angle!,
                                child: AnimatedOpacity(
                                  curve: Curves.easeIn,
                                  duration: const Duration(milliseconds: 2000),
                                  opacity: element.remove == true ? 0 : 1,
                                  child: IgnorePointer(
                                    ignoring: true,
                                    child: SvgPicture.asset(
                                      'assets/icons/favorite.svg',
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
