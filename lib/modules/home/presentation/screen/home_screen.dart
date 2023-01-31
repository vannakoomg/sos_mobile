import 'package:flutter/material.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';
import 'package:sos_mobile/utils/helpers/conllection_controller.dart/collection_controller.dart';
import 'package:sos_mobile/utils/widgets/question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    debugPrint("${getIt<HomeContoller>().question}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: getIt<HomeContoller>().question.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: QuestionCard(
                title: getIt<HomeContoller>().question[i].title!,
                vote: getIt<HomeContoller>().question[i].votes,
                answer: getIt<HomeContoller>().question[i].answer!,
                image: getIt<HomeContoller>().question[i].image,
              ),
            );
          },
        ),
      ),
    );
  }
}
