import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 0, right: 0),
            color: Colors.black.withOpacity(0.9),
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              controller: scrollController,
              itemCount: getIt<HomeContoller>().question.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      margin: const EdgeInsets.only(bottom: 20, top: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 0.4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "what is the car dfdkfjdkff",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          const Spacer(),
                          const Text("10",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17)),
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 8, top: 8, left: 8, right: 8),
                            height: 22,
                            width: 0.6,
                            color: Colors.white,
                          ),
                          const Text("30",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17)),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    QuestionCard(
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
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
