import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/BottomNavigationBar/controller/bottom_navigation_bar.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';
import 'package:sos_mobile/modules/profile/screen/profile_screen.dart';

import '../../home/controllers/home_controller.dart';
import '../../notification/screens/notificaition_screen.dart';
import '../../post_question/screen/post_question_screen.dart';
import '../../save/screens/save_screen.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget? child;
  const ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigatonBarController());
    final homeController = Get.put(HomeContoller());
    return Obx(() => Scaffold(
          backgroundColor: Colors.black,
          body: IndexedStack(
            index: controller.index.value,
            children: const [
              HomeScreen(),
              SaveScreen(),
              PostQuestionScreen(),
              NotificationScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: homeController.scrollPixel.value < 250 ||
                  homeController.scrollPixalBack.value > 200
              ? Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  color: controller.index.value == 2
                      ? AppColor.mainColor.withOpacity(0.6)
                      : AppColor.mainColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (controller.index.value == 0) {
                              if (homeController.scrollPixel.value < 10) {
                                homeController.fetchQuestion(1);
                              } else {
                                homeController.scrollController.value.animateTo(
                                    0,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.ease);
                              }
                            } else {
                              controller.index.value = 0;
                            }
                            debugPrint("ddsssd");
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Icon(Icons.home_filled,
                                color: controller.index.value == 0
                                    ? AppColor.secondnaryColor
                                    : AppColor.primaryColor),
                          ),
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          controller.index.value = 1;
                        },
                        child: Container(
                          height: 60,
                          color: Colors.transparent,
                          child: Icon(Icons.save_alt,
                              color: controller.index.value == 1
                                  ? AppColor.secondnaryColor
                                  : AppColor.primaryColor),
                        ),
                      )),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.index.value = 2;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Icon(Icons.question_mark_rounded,
                                color: controller.index.value == 2
                                    ? AppColor.secondnaryColor
                                    : AppColor.primaryColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.index.value = 3;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Icon(Icons.notifications,
                                color: controller.index.value == 3
                                    ? AppColor.secondnaryColor
                                    : AppColor.primaryColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.index.value = 4;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Icon(Icons.person,
                                color: controller.index.value == 4
                                    ? AppColor.secondnaryColor
                                    : AppColor.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ))
              : const SizedBox(),
        ));
  }
}
