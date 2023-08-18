import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';

import '../../../configs/const/Colors/app_colors.dart';

class PageSliy extends StatelessWidget {
  const PageSliy({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionDetailController());
    return SizedBox(
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: GestureDetector(
          onTap: () {
            controller.isAnswer.value = !controller.isAnswer.value;
          },
          child: Stack(
            children: [
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
              AnimatedPositioned(
                top: 2.5,
                left: controller.isAnswer.value == true ? 2 : 75,
                duration: const Duration(milliseconds: 250),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 30,
                  width: controller.isAnswer.value == true ? 60 : 43,
                  decoration: BoxDecoration(
                    color: AppColor.mainColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("ចម្លើយ"),
                    Text("មតិ"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
