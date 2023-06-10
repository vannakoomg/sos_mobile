import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/save/controller/save_controller.dart';

import '../../../utils/widgets/custom_question_card.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SaveController());
    return Column(children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 20, right: 8, left: 8),
          child: ListView.builder(
            itemCount: controller.question.length,
            itemBuilder: (context, i) {
              return QuestionCard(
                key: controller.question[i].key,
                ontap: () {
                  Get.toNamed("question-detail");
                },
                tag: controller.question[i].tag!,
                onLongPress: () {
                  // _controller.showOverlay(context, _controller.question[i].key);
                  // _controller.isLongPress.value = true;
                },
                onLongPressStart: (value) {
                  // _controller.dx.value = value.globalPosition.dx - 25;
                  // _controller.dy.value = value.globalPosition.dy - 100;
                },
                onLongPressEnd: () {
                  // _controller.overlayEntry?.remove();
                  // _controller.isLongPress.value = false;
                },
                title: controller.question[i].title!,
                vote: controller.question[i].votes,
                answer: controller.question[i].answer!,
                image: controller.question[i].image,
              );
            },
          ),
        ),
      ),
    ]);
  }
}
