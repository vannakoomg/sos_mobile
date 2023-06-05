import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/home/presentation/screen/home_screen.dart';
import 'package:sos_mobile/modules/post_question/screen/post_question_screen.dart';
import 'package:sos_mobile/modules/profile/presentation/screen/profile_screen.dart';
import '../../home/presentation/logic/home_controller.dart';
import 'package:get/get.dart';

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
          body: bottonNavigetionController.index.value == 1
              ? const HomeScreen()
              : bottonNavigetionController.index.value == 2
                  ? const PostQuestionScreen()
                  : ProfileScreen(),
          bottomNavigationBar: controller.scrollPixel.value < 250 ||
                  controller.scrollPixalBack.value > 200
              ? Container(
                  height: 60,
                  width: double.infinity,
                  color: AppColor.mainColor,
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
                              Icons.add,
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
