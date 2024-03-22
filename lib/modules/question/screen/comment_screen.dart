import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/question/controller/comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_showModalBottomSheet.dart';

import '../../../utils/widgets/custom_comment_crad.dart';

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(CommentController());
  final questionDetailcontroller = Get.put(QuestionDetailController());
  @override
  void initState() {
    controller.fetchCommentInQuestion(widget.id, controller.currentPage.value);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(
      () => controller.isloading.value && controller.commentInQuestion.isEmpty
          ? Container(
              margin: const EdgeInsets.only(top: 10),
              child: const CustomLoading(),
            )
          : controller.commentInQuestion.isNotEmpty
              ? Column(
                  children: [
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: ((notification) {
                          if (notification.metrics.pixels >=
                                  notification.metrics.maxScrollExtent &&
                              notification.metrics.maxScrollExtent != 0) {
                            controller
                                .fetchCommentInQuestionNextPage(widget.id);
                          }
                          return true;
                        }),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView(
                                controller:
                                    questionDetailcontroller.tabIndex.value == 1
                                        ? null
                                        : controller.scrollController.value,
                                padding: EdgeInsets.zero,
                                children: controller.commentInQuestion
                                    .asMap()
                                    .entries
                                    .map((element) {
                                  return Column(
                                    children: [
                                      CustomCommentCrad(
                                        name:
                                            "${controller.commentInQuestion.length}",
                                        time: "${element.key}",
                                        ontapProfile: () {
                                          context.pushNamed(
                                            '/user-profile',
                                            pathParameters: {"id": "2000"},
                                          );
                                        },
                                        countLike: "34",
                                        title: 'fsadfdsaf',
                                        ontapLike: () {
                                          debugPrint("like 123");
                                        },
                                        ontapMore: () {
                                          customShowModalBottomSheet(
                                              context: context,
                                              height: 200,
                                              list: ["Report"],
                                              title: "comment",
                                              ontap: (key) {});
                                        },
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                            if (controller.isloading.value &&
                                controller.commentInQuestion.isNotEmpty)
                              const SizedBox(
                                  height: 45, width: 45, child: CustomLoading())
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Container(
                  margin: const EdgeInsets.only(top: 40),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "No Comment",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
    );
  }
}
