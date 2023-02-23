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
    _controller.getQuestion();
    scrollController.addListener(() {
      _controller.scrollPixel.value = scrollController.offset;
      if(_controller.scrollPixel.value>100){
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
      body:Obx(() =>  Container(
        color: AppColor.backgroundColor,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 0, right: 0),
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _controller.listPropertyData.length,
                  itemBuilder: (context, i) {
                    return QuestionCard(
                      // key: _controller.question[0].key,
                      ontap: () {
                        context.go('/home/question-detail');
                      },
                      onLongPress: () {
                        _controller.showOverlay(
                            context, _controller.question[0].key);
                      },
                      onLongPressDown: (value) {
                        debugPrint("${value.globalPosition.dx}");
                        debugPrint("${value.globalPosition.dy}");
                      },
                      onLongPressEnd: () {
                        _controller.overlayEntry?.remove();
                      },
                      indexPage: i,
                      title: _controller.question[0].title!,
                      vote: _controller.question[0].votes,
                      answer: _controller.question[0].answer!,
                      image: _controller.question[0].image,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
