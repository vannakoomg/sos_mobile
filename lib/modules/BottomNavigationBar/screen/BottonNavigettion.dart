// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/BottomNavigationBar/controller/bottom_navigation_bar.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';
import 'package:sos_mobile/modules/profile/screen/profile_screen.dart';
import 'package:sos_mobile/modules/save/controller/save_category_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../../notification/screens/notificaition_screen.dart';
import '../../post_question/screen/post_question_screen.dart';
import '../../save/screens/save_category_screen.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget? child;
  const ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigatonBarController());
    final homeController = Get.put(HomeContoller());
    final saveCategoryController = Get.put(SaveCategoryController());
    return Obx(() => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: controller.index.value,
                  children: const [
                    HomeScreen(),
                    SaveCategoryScreen(),
                    PostQuestionScreen(),
                    NotificationScreen(),
                    OwnProfileScreen(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: homeController.scrollPixel.value < 250 ||
                  homeController.scrollPixalBack.value > 200
              ? Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      border: Border(
                          top: BorderSide(
                              color: Theme.of(context).colorScheme.onTertiary,
                              width: 0.5))),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: controller.icon.asMap().entries.map((e) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.index.value = e.key;
                            if (homeController.scrollPixel.value < 10) {
                              homeController.fetchQuestion(1);
                            } else {
                              homeController.scrollController.value.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            }
                            if (controller.index.value == 1) {
                              saveCategoryController.fetchSaveCategory();
                            }
                          },
                          child: Transform.rotate(
                            angle: 0,
                            child: Container(
                              height: 60,
                              color: Colors.transparent,
                              child: Icon(e.value,
                                  size: 25,
                                  color: controller.index.value == e.key
                                      ? AppColor.secondnaryColor
                                      : Theme.of(context).colorScheme.primary),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ))
              : const SizedBox(),
        ));
  }
}
