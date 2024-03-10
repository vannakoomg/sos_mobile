import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/widgets/custom_comment_crad.dart';
import '../controller/question_detail_controller.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final controller = Get.put(QuestionDetailController());
  @override
  void initState() {
    controller.listenScoller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller.scrollerController03,
      physics: controller.isScroll.value || controller.jumpAll.value
          ? null
          : const NeverScrollableScrollPhysics(),
      itemCount: 40,
      itemBuilder: (context, i) {
        return CustomCommentCrad(
          ontapProfile: () {
            context.pushNamed('/user-profile', pathParameters: {"id": "reer"});
          },
          ontap: () {
            controller.ontapMoreComment(context);
          },
          name: "vannak",
          time: "4h ago ",
          title:
              "ជួយបញ្ជាjlkjfajslkfdjlkafjjfklsjflkajsfljasfljsafdlក់បន្ថែមតិចមើលញុំដូចអត់សូវយល់",
        );
      },
    );
  }
}
