import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';

import '../../../utils/widgets/custom_question_card.dart';
import '../../save/screens/save_screen.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  final controller = Get.put(HomeContoller());
  final appController = Get.put(AppController());
  final _pageController = PageController();
  @override
  void initState() {
    controller.fetchQuestion();
    scrollController.addListener(() {
      controller.scrollPixel.value = scrollController.offset;
      if (controller.oldScrollPixel.value > controller.scrollPixel.value) {
        controller.scrollPixalBack.value =
            controller.oldScrollPixel.value - controller.scrollPixel.value;
        if (controller.scrollPixalBack.value > controller.oldScrollback.value) {
          controller.oldScrollback.value = controller.scrollPixalBack.value;
        } else {
          controller.oldScrollPixel.value = controller.scrollPixel.value;
        }
      } else {
        controller.scrollPixalBack.value = 0;
        controller.oldScrollback.value = 0;
        controller.oldScrollPixel.value = controller.scrollPixel.value;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: AppColor.mainColor,
          child: Stack(
            children: [
              if (controller.isLoading.value == false)
                PageView(
                  onPageChanged: (value) {
                    controller.isForYou.value = !controller.isForYou.value;
                  },
                  allowImplicitScrolling: true,
                  controller: _pageController,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20, right: 5, left: 5),
                      width: double.infinity,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onLongPressStart: (value) {
                              appController.onlongPressStart(
                                  golbalDx: value.globalPosition.dx,
                                  golbalDy: value.globalPosition.dy,
                                  widthScreen:
                                      MediaQuery.of(context).size.width);
                            },
                            onLongPressMoveUpdate: (value) {
                              appController.onLongPressMoveUpdate(
                                  globalDx: value.globalPosition.dx,
                                  globalDy: value.globalPosition.dy);
                            },
                            onLongPressEnd: (value) {
                              appController.onLongPressEnd();
                            },
                            child: QuestionCard(
                              ontap: () {
                                Get.toNamed("question-detail");
                              },
                              questiondata: controller.homeData.value.data![1],
                            ),
                          );
                        },
                      ),
                    ),
                    const SaveScreen()
                  ],
                ),
              Container(
                height: 80,
                color: AppColor.mainColor.withOpacity(0.95),
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (controller.isForYou.value) {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      } else {
                        _pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          AnimatedContainer(
                            margin: EdgeInsets.only(
                                left: controller.isForYou.value ? 2 : 78,
                                top: 2),
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: controller.isForYou.value ? 70 : 40,
                          ),
                          Positioned(
                              left: 10,
                              top: 10,
                              child: Text(
                                "សំរាប់អ្នក",
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          const Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(Icons.save_alt_rounded))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
