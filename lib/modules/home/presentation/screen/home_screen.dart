import 'package:flutter/material.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'package:sos_mobile/utils/widgets/question_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
        child: ListView.builder(
          itemCount: getIt<HomeContoller>().question.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: QuestionCard(
                title: getIt<HomeContoller>().question[i].title!,
                image: getIt<HomeContoller>().question[i].image!,
                description: getIt<HomeContoller>().question[i].description!,
                answer: getIt<HomeContoller>().question[i].answer!,
                votes: getIt<HomeContoller>().question[i].votes!,
              ),
            );
          },
        ),
      ),
    );
  }
}
