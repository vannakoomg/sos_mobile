import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';

import '../../../../utils/widgets/question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      getIt<HomeContoller>().scrollPixel.value = scrollController.offset;
      getIt<HomeContoller>().oldScrollPixel.value =
          getIt<HomeContoller>().scrollPixel.value;
      debugPrint("${scrollController.offset}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  itemCount: getIt<HomeContoller>().question.length,
                  itemBuilder: (context, i) {
                    return QuestionCard(
                      key: getIt<HomeContoller>().question[i].key,
                      ontap: () {
                        context.go('/home/question-detail');
                      },
                      onLongPress: () {
                        getIt<HomeContoller>().showOverlay(
                            context, getIt<HomeContoller>().question[i].key);
                      },
                      onLongPressDown: (value) {
                        debugPrint("${value.globalPosition.dx}");
                        debugPrint("${value.globalPosition.dy}");
                      },
                      onLongPressEnd: () {
                        getIt<HomeContoller>().overlayEntry?.remove();
                      },
                      title: getIt<HomeContoller>().question[i].title!,
                      vote: getIt<HomeContoller>().question[i].votes,
                      answer: getIt<HomeContoller>().question[i].answer!,
                      image: getIt<HomeContoller>().question[i].image,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
