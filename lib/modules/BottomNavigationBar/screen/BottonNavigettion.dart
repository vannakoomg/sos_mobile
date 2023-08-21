import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

import '../../home/controllers/home_controller.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget? child;
  const ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: child,
        bottomNavigationBar: Obx(
          () => controller.scrollPixel.value < 250 ||
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
                            context.go('/home');
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
                          context.go('/save');
                        },
                        child: Container(
                          height: 60,
                          color: Colors.transparent,
                          child: const Icon(
                            Icons.save_alt,
                            color: Colors.white,
                          ),
                        ),
                      )),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.go('/post-question');
                          },
                          child: Container(
                            height: 60,
                            color: Colors.transparent,
                            child: const Icon(
                              Icons.question_mark_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.go('/notification');
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
                            context.go('/profile');
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
