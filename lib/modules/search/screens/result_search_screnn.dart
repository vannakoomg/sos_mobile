import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/search/controller/result_search_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

import '../../../utils/controllers/singleTon.dart';
import '../../../utils/widgets/custom_loading.dart';
import '../../../utils/widgets/custom_question_card.dart';

class ResultSearchScreen extends StatefulWidget {
  final String text;
  const ResultSearchScreen({super.key, required this.text});
  @override
  State<ResultSearchScreen> createState() => _ResultSearchScreenState();
}

class _ResultSearchScreenState extends State<ResultSearchScreen> {
  final controller = ResultSearchController();
  @override
  void initState() {
    controller.fetchResultSearch(widget.text, 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: widget.text),
        body: Obx(() => Container(
              height: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Expanded(
                  child: !controller.isloading.value
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          // controller: controller.scrollController.value,
                          itemCount: controller.resultSearch.length,
                          itemBuilder: (context, i) {
                            return CustomQuestionCard(
                              isHighlight: true,
                              textHighlight: widget.text,
                              questionId: "${controller.resultSearch[i].id}",
                              istall: i % 2 != 0 ? false : true,
                              title: "${controller.resultSearch[i].title}",
                              tags: const [
                                "dfa2341241344334534534534sfd",
                                "dfa2341241344334534534534sfd",
                                "dfa2341241344334534534534sfd",
                                "dfa2341241344334534534534sfd",
                                "dfa2341241344334534534534sfd",
                              ],
                              answerCount: "${controller.resultSearch[i].id}",
                              ontapQuestion: () {
                                Singleton.obj.questionId = i;
                                context.pushNamed("question-detail",
                                    pathParameters: {
                                      "id": controller.resultSearch[i].id
                                          .toString()
                                    });
                              },
                              isCorrect: false,
                              descrition:
                                  "${controller.resultSearch[i].description}",
                              image: "",
                              commentCount: "",
                              likeCount: "",
                            );
                          },
                        )
                      : const CustomLoading()),
            )));
  }
}
