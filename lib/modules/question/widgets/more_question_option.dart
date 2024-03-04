import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/utils/controllers/singleTon.dart';

import '../../../configs/const/Colors/app_colors.dart';
import '../../../utils/widgets/custom_buttom.dart';
import '../../../utils/widgets/custom_comfirm_yes_no.dart';
import '../../report/screens/report_type_screen.dart';

class MoreQuesionOption extends StatelessWidget {
  final String questionId;
  const MoreQuesionOption({
    super.key,
    required this.questionId,
  });

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeContoller());
    final questionDetailController = Get.put(QuestionDetailController());
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 260,
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
        decoration: BoxDecoration(
          color: AppColor.textfourth,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            "Option",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColor.textThird, fontSize: 18),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    "Hide",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Text(
                    "Download Photo",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: false,
                        builder: ((context) {
                          return const ReportTypeScreen();
                        }));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Report",
                              style: Theme.of(context).textTheme.titleMedium!),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 20,
                          color: AppColor.textThird,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CustomComfirmYesNo(
                          ontapYes: () {
                            debugPrint("question id $questionId");
                            questionDetailController
                                .deleteQuestion(questionId)
                                .then((value) {
                              homeController.question
                                  .removeAt(Singleton.obj.questionId);
                              homeController.question.refresh();
                              context.pop();
                            });
                          },
                          ontapNo: () {
                            context.pop();
                          },
                          title: "Delete",
                          subTitle: "តើអ្នកពិតជាចង់លុបសំនួរនេះមេនទេ ?",
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Text(
                      "Delete",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButtom(
            height: 40,
            title: "Close",
            onTap: () {
              context.pop();
            },
          )
        ]),
      ),
    ));
  }
}
