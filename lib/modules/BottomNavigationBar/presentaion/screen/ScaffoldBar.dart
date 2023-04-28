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
                  color: Colors.black,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.go('/home');
                        },
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            context.go('/profile');
                          },
                          child: const Icon(
                            Icons.propane_outlined,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 100,
                      ),
                    ],
                  ))
              : const SizedBox(),
        ));
  }
}
