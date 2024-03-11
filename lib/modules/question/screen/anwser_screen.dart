import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';

import '../../../utils/widgets/custom_answer_card.dart';

class AnwserScreen extends StatefulWidget {
  final String id;
  const AnwserScreen({super.key, required this.id});

  @override
  State<AnwserScreen> createState() => _AnwserScreenState();
}

class _AnwserScreenState extends State<AnwserScreen> {
  final controller = Get.put(QuestionDetailController());
  final anwserController = Get.put(AnwserController());
  @override
  void initState() {
    anwserController.fetchAnwserInQuestion(widget.id);
    controller.listenScoller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => anwserController.isloaing.value
        ? const Center(
            child: Text("No Anwser"),
          )
        : ListView.builder(
            controller: controller.scrollerController02,
            physics: controller.isScroll.value || controller.jumpAll.value
                ? null
                : const NeverScrollableScrollPhysics(),
            itemCount: anwserController.anwserInQuestion.length,
            itemBuilder: (context, i) {
              return CustomAnswerCrad(
                isCorrect: false,
                isYourOwnQuestion: false,
                name: "ចាន់ថា",
                time: "១០​ថ្ងៃមុន",
                description:
                    "${anwserController.anwserInQuestion[i].description}",
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
          ));
  }
}
