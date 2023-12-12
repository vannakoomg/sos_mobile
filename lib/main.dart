// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';
import 'package:sos_mobile/utils/helpers/notification/listion_notification.dart';
import 'configs/route/route.dart';
import 'configs/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  listNotification();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppController());
    return GestureDetector(
      onTap: () {
        unFocus(context);
      },
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        theme: theme(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Obx(() => Scaffold(
                  body: Stack(
                children: [
                  child!,
                  AnimatedOpacity(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 250),
                    opacity: controller.isLongPress.value ? 1 : 0,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: controller.isLongPress.value
                          ? Colors.black.withOpacity(0.90)
                          : null,
                    ),
                  ),
                  if (controller.isLongPress.value == true)
                    Stack(
                      children: [
                        Positioned(
                            top: controller.dy.value + 25,
                            left: controller.dx.value + 25,
                            child: Container(
                              height: 5,
                              width: 5,
                              color: Colors.red,
                            )),
                        Positioned(
                          left: controller.isOnleft.value ? null : 10,
                          right: controller.isOnleft.value ? 10 : null,
                          top: controller.dy.value > 200
                              ? controller.dy.value - 130
                              : controller.dy.value + 40,
                          child: Text(
                            controller.action.value,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        AnimatedPositioned(
                          left: controller.afterLongPress.value
                              ? controller.dx.value - 10
                              : controller.dx.value + 5,
                          top: controller.afterLongPress.value
                              ? controller.isPress01.value
                                  ? controller.dy.value - 90
                                  : controller.dy.value - 75
                              : controller.dy.value + 5,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOutQuint,
                          child: MouseRegion(
                            onEnter: (event) {
                              debugPrint("sdfdsfsfd");
                            },
                            onHover: (value) {
                              debugPrint("sdfdsfsfd");
                            },
                            onExit: (value) {
                              debugPrint("sdfdsfsfd");
                            },
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
                              child: const Icon(Icons.favorite),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: controller.afterLongPress.value
                              ? controller.isPress02.value
                                  ? controller.dx.value +
                                      (controller.isOnleft.value ? 70 : -70)
                                  : controller.dx.value +
                                      (controller.isOnleft.value ? 40 : -60)
                              : controller.dx.value + 5,
                          top: controller.afterLongPress.value
                              ? controller.isPress02.value
                                  ? controller.dy.value - 60
                                  : controller.dy.value - 65
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
                            child: const Center(
                                child: Icon(Icons.save_alt_outlined)),
                          ),
                        ),
                        AnimatedPositioned(
                          left: controller.afterLongPress.value
                              ? controller.isPress03.value
                                  ? controller.dx.value +
                                      (controller.isOnleft.value ? 95 : -95)
                                  : controller.dx.value +
                                      (controller.isOnleft.value ? 70 : -60)
                              : controller.dx.value,
                          top: controller.afterLongPress.value
                              ? controller.dy.value - 40
                              : controller.dy.value,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOutQuint,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: controller.isPress03.value ? 57 : 45,
                                width: controller.isPress03.value ? 57 : 45,
                                decoration: BoxDecoration(
                                  color: controller.isPress03.value
                                      ? AppColor.secondnaryColor
                                      : AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(child: Icon(Icons.send)),
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: controller.afterLongPress.value
                              ? controller.isPress04.value
                                  ? controller.dx.value +
                                      (controller.isOnleft.value ? 80 : -85)
                                  : controller.dx.value +
                                      (controller.isOnleft.value ? 75 : -75)
                              : controller.dx.value,
                          top: controller.afterLongPress.value
                              ? controller.dy.value + 10
                              : controller.dy.value,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOutQuint,
                          child: SizedBox(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                height: controller.isPress04.value ? 57 : 45,
                                width: controller.isPress04.value ? 57 : 45,
                                decoration: BoxDecoration(
                                  color: controller.isPress04.value
                                      ? AppColor.secondnaryColor
                                      : AppColor.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(child: Icon(Icons.report)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              )));
        },
      ),
    );
  }
}
