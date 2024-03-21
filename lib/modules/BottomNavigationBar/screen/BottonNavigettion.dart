// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/BottomNavigationBar/controller/bottom_navigationbar_controller.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';
import 'package:sos_mobile/modules/profile/screen/own_profile_screen.dart';
import 'package:sos_mobile/modules/cateory/controller/category_controller.dart';
import '../../../configs/const/Colors/app_colors.dart';
import '../../../utils/controllers/singleton.dart';
import '../../../utils/helpers/notification/listion_notification.dart';
import '../../home/controllers/home_controller.dart';
import '../../notification/screens/notificaition_screen.dart';
import '../../post_question/screen/post_question_screen.dart';
import '../../cateory/screens/category_screen.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget? child;
  const ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    countNotification();

    final controller = Get.put(BottomNavigatonBarController());
    final homeController = Get.put(HomeContoller());
    final categoryController = Get.put(CategoryController());
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
                    SizedBox(),
                    NotificationScreen(),
                    OwnProfileScreen(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: (homeController.scrollPixel.value < 250 ||
                      homeController.scrollPixalBack.value > 200) &&
                  homeController.isShowBottonNavigettion.value
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
                            if (e.key != 2) {
                              controller.index.value = e.key;
                            }

                            if (e.key == 1) {
                              categoryController.fetchSaveCategory();
                            }
                            if (e.key == 2) {
                              // showModalBottomSheet(
                              //     context: context,
                              //     isScrollControlled: true,
                              //     builder: ((context) {
                              //       return ReportTypeDetailScreen(
                              //         title: "",
                              //         id: 2,
                              //       );
                              //     }));
                              showModalBottomSheet(
                                  useSafeArea: true,
                                  context: context,
                                  isScrollControlled: true,
                                  builder: ((context) {
                                    return Container(
                                        padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        child: const PostQuestionScreen());
                                  }));
                            }
                            if (e.key == 0) {
                              {
                                if (homeController.scrollPixel.value < 10) {
                                  homeController.nextPage.value = 0;
                                  homeController.fetchQuestion(1);
                                } else {
                                  homeController.scrollController.value
                                      .animateTo(
                                    0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: Center(
                              child: Stack(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    height: 45,
                                    width: 55,
                                    child: Icon(
                                      e.value,
                                      size: 25,
                                      weight: 7,
                                      color: controller.index.value == e.key
                                          ? AppColor.secondnaryColor
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
                                    ),
                                  ),
                                  if (e.key == 3)
                                    Positioned(
                                      left: 27,
                                      top: 5,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 4,
                                          right: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.red,
                                        ),
                                        child: Text(
                                          "${Singleton.obj.numberNotification.value}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    )
                                ],
                              ),
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
