import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
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
    // TODO: implement initState
    debugPrint("${getIt<HomeContoller>().question}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: getIt<HomeContoller>().onTapQuestion.value == false
            ? Colors.white
            : Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 0),
          child: ListView.builder(
            itemCount: getIt<HomeContoller>().question.length,
            itemBuilder: (context, i) {
              return Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: QuestionCard(
                  // keyQ: getIt<HomeContoller>().question[i].key,
                  isShow: getIt<HomeContoller>().onTapQuestion.value,
                  onLongPress: () {
                    getIt<HomeContoller>().onTapQuestion.value = true;
                    debugPrint("ok");
                  },
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
        bottomNavigationBar: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              border: Border.all(color: AppColor.mainColor)),
        ),
      ),
    );
  }
}
