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
      //  backgroundColor: Colors.black.withOpacity(0.2),
      // backgroundColor: getIt<HomeContoller>().onTapQuestion.value == false
      //     ? Colors.black.withOpacity(0.8)
      //     : Colors.black,
      body: Container(
        color: Colors.grey[200],
        height: double.infinity,
        width: double.infinity,
        // padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 0),
        child: ListView.builder(
          itemCount: getIt<HomeContoller>().question.length,
          itemBuilder: (context, i) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const QuestionCard(
                  // keyQ: getIt<HomeContoller>().question[i].key,
                  // isShow: getIt<HomeContoller>().onTapQuestion.value,
                  // onLongPress: () {
                  //   getIt<HomeContoller>().onTapQuestion.value = true;
                  //   debugPrint("ok");
                  // },
                  // title: getIt<HomeContoller>().question[i].title!,
                  // image: getIt<HomeContoller>().question[i].image!,
                  // description: getIt<HomeContoller>().question[i].description!,
                  // answer: getIt<HomeContoller>().question[i].answer!,
                  // votes: getIt<HomeContoller>().question[i].votes!,
                  ),
            );
          },
        ),
      ),
    );
  }
}
