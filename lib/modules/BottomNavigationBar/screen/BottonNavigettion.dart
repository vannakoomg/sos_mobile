import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/screen/home_screen.dart';
import 'package:sos_mobile/modules/post_question/screen/post_question_screen.dart';
import 'package:sos_mobile/modules/profile/screen/profile_screen.dart';
import '../../home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../search/screens/search_screen.dart';
import '../controller/bottom_navigation_bar.dart';

class BottonNavigettion extends StatelessWidget {
  const BottonNavigettion({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    final bottonNavigetionController = Get.put(BottomNavigatonBar());
    return Obx(() => Scaffold(
          backgroundColor: AppColor.mainColor,
          body: bottonNavigetionController.index.value == 1
              ? const HomeScreen()
              : bottonNavigetionController.index.value == 2
                  ? const SearchScreen()
                  : bottonNavigetionController.index.value == 3
                      ? const PostQuestionScreen()
                      : bottonNavigetionController.index.value == 4
                          ? const PostQuestionScreen()
                          : const ProfileScreen(),
          bottomNavigationBar: controller.scrollPixel.value < 250 ||
                  controller.scrollPixalBack.value > 200
              ? Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bottonNavigetionController.index.value = 1;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bottonNavigetionController.index.value = 2;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bottonNavigetionController.index.value = 3;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bottonNavigetionController.index.value = 4;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            bottonNavigetionController.index.value = 5;
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
              : const SizedBox(),
        ));
  }
}
