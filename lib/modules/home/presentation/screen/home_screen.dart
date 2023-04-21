import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';

import '../../../../utils/widgets/question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  final _controller = Get.put(HomeContoller());
  @override
  void initState() {
    // _controller.getQuestion();
    scrollController.addListener(() {
      _controller.scrollPixel.value = scrollController.offset;
      if (_controller.scrollPixel.value > 100) {
        debugPrint("ncie to meet you ");
        _controller.getQuestion();
      }
      _controller.oldScrollPixel.value = _controller.scrollPixel.value;
      debugPrint("${scrollController.offset}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
          color: AppColor.backgroundColor,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _controller.question.length,
                  itemBuilder: (context, i) {
                    return QuestionCard(
                      key: _controller.question[i].key,
                      ontap: () {
                        context.go('/home/question-detail/100 ');
                      },
                      onLongPress: () {
                        _controller.showOverlay(
                            context, _controller.question[i].key);
                        _controller.isLongPress.value = true;
                      },
                      onLongPressStart: (value) {
                        _controller.dx.value = value.globalPosition.dx - 25;
                        _controller.dy.value = value.globalPosition.dy - 100;
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
              if (_controller.isLongPress.value == true)
                Container(
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        left: _controller.dx.value,
                        top: _controller.dy.value,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linearToEaseOut,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
