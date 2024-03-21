import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

import '../../../utils/widgets/custom_answer_card.dart';

class AnwserScreen extends StatefulWidget {
  final String id;
  const AnwserScreen({super.key, required this.id});

  @override
  State<AnwserScreen> createState() => _AnwserScreenState();
}

class _AnwserScreenState extends State<AnwserScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final controller = AnwserController();
  final questionDetailcontroller = Get.put(QuestionDetailController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    controller.fetchAnwserInQuestion(widget.id, controller.currentPage.value);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () => controller.isloading.value && controller.anwserInQuestion.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CustomLoading(),
            )
          : controller.anwserInQuestion.isNotEmpty
              ? NotificationListener<ScrollNotification>(
                  onNotification: ((notification) {
                    debugPrint("${notification.metrics.pixels}");
                    if (notification.metrics.pixels >=
                        notification.metrics.maxScrollExtent) {
                      controller.fetchAnwserInQuestionNextPage(widget.id);
                    }
                    return true;
                  }),
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: controller.anwserInQuestion.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, i) {
                          return CustomAnswerCrad(
                            isCorrect: false,
                            isYourOwnQuestion: false,
                            name: "ចាន់ថា",
                            time: "១០​ថ្ងៃមុន",
                            description:
                                "${controller.anwserInQuestion[i].description}",
                            image: "",
                            commentCount: "4",
                            likeAnswer: "50",
                            ontapProfile: () {
                              context.pushNamed(
                                '/user-profile',
                                pathParameters: {"id": "2000"},
                              );
                            },
                            ontapCorrect: () {
                              debugPrint("khmer sl khmer ");
                            },
                            ontap: () {},
                            avarta:
                                "https://www.shareicon.net/data/256x256/2016/05/26/771203_man_512x512.png",
                          );
                        },
                      ),
                      // AnimatedPositioned(child: child, duration: duration)
                    ],
                  ),
                )
              : Container(
                  margin: const EdgeInsets.only(top: 40),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "No Anwser",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
    );
  }
}
