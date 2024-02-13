import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_question_card.dart';

class HideScreen extends StatelessWidget {
  const HideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Hided"),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        height: double.infinity,
        child: Column(children: [
          Column(
            children: [
              CsutomQuestionCard(
                isCorrect: false,
                tags: const ["3", "3"],
                time: "qw",
                image: "https://i.ytimg.com/vi/yWMKYID5fr8/maxresdefault.jpg",
                commentCount: "2",
                title: "khmer sl khmer",
                likeCount: "10",
                answerCount: "56",
                ontapQuestion: () {},
              )
            ],
          )
        ]),
      ),
    );
  }
}
