import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/logic/home_controller.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget? child;
  const ScaffoldWithNavBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    return Scaffold(
        body: child,
        bottomNavigationBar: Obx(
          () => controller.scrollPixel.value < 250 ||
                  controller.scrollPixalBack.value > 200
              ? Container(
                  height: 60,
                  width: double.infinity,
                  color: Colors.black,
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            debugPrint("nice to meet you ");
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
                            debugPrint("nice to meet you ");
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
