import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/save/screens/save_screen.dart';

import '../../../utils/widgets/custom_question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  final _controller = Get.put(HomeContoller());
  final _pageController = PageController();
  @override
  void initState() {
    scrollController.addListener(() {
      _controller.scrollPixel.value = scrollController.offset;
      if (_controller.oldScrollPixel.value > _controller.scrollPixel.value) {
        _controller.scrollPixalBack.value =
            _controller.oldScrollPixel.value - _controller.scrollPixel.value;
        if (_controller.scrollPixalBack.value >
            _controller.oldScrollback.value) {
          _controller.oldScrollback.value = _controller.scrollPixalBack.value;
        } else {
          _controller.oldScrollPixel.value = _controller.scrollPixel.value;
        }
      } else {
        _controller.scrollPixalBack.value = 0;
        _controller.oldScrollback.value = 0;
        _controller.oldScrollPixel.value = _controller.scrollPixel.value;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          // margin: const EdgeInsets.only(left: 4, right: 4),
          color: AppColor.mainColor,
          child: Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  _controller.isForYou.value = !_controller.isForYou.value;
                },
                allowImplicitScrolling: true,
                controller: _pageController,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 80, right: 8, left: 8),
                    width: double.infinity,
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: _controller.question.length,
                      itemBuilder: (context, i) {
                        return QuestionCard(
                          key: _controller.question[i].key,
                          ontap: () {
                            Get.toNamed("question-detail");
                          },
                          tag: _controller.question[i].tag!,
                          onLongPress: () {
                            _controller.showOverlay(
                                context, _controller.question[i].key);
                            _controller.isLongPress.value = true;
                          },
                          onLongPressStart: (value) {
                            _controller.dx.value = value.globalPosition.dx - 25;
                            _controller.dy.value =
                                value.globalPosition.dy - 100;
                          },
                          onLongPressEnd: () {
                            _controller.overlayEntry?.remove();
                            _controller.isLongPress.value = false;
                          },
                          title: _controller.question[i].title!,
                          vote: _controller.question[i].votes,
                          answer: _controller.question[i].answer!,
                          image: _controller.question[i].image,
                        );
                      },
                    ),
                  ),
                  const SaveScreen()
                ],
              ),
              Container(
                height: 80,
                color: AppColor.mainColor,
                width: double.infinity,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.isForYou.value) {
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
                                left: _controller.isForYou.value ? 2 : 78,
                                top: 2),
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(20)),
                            width: _controller.isForYou.value ? 70 : 40,
                          ),
                          const Positioned(
                              left: 10, top: 10, child: Text("សំរាប់អ្នក")),
                          const Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(Icons.favorite_sharp))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (_controller.isLongPress.value == true)
                Stack(
                  children: [
                    AnimatedPositioned(
                      left: _controller.dx.value,
                      top: _controller.dy.value,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
