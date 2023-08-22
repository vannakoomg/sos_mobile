import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_comment_crad.dart';

import '../widgets/answer_card.dart';
import '../widgets/page_sliy.dart';

class QuestionDetail extends StatelessWidget {
  const QuestionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionDetailController());
    final commentController = Get.put(AnswerCommentController());
    return GestureDetector(
      onTap: () {
        unFocus(context);
        commentController.isPost.value = false;
      },
      child: Scaffold(
          backgroundColor: AppColor.mainColor,
          body: Obx(
            () => SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      child: SingleChildScrollView(
                        child: AnimatedContainer(
                          margin: controller.isScale.value
                              ? const EdgeInsets.only(top: 3, left: 3, right: 3)
                              : const EdgeInsets.all(0),
                          duration: const Duration(milliseconds: 200),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        'https://i.pinimg.com/736x/d5/cb/83/d5cb8311c9d8f7f076c0475726c4913f.jpg',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width: MediaQuery.of(context).size.height,
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  SizedBox(
                                    height: 60,
                                    child: Row(children: [
                                      IconButton(
                                          onPressed: () {
                                            context.pop();
                                            debugPrint("nice to meet you ");
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                          )),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            controller.isScale.value =
                                                !controller.isScale.value;
                                          },
                                          icon: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.black,
                                          ))
                                    ]),
                                  )
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 20),
                                decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          // decoration: const BoxDecoration(
                                          //     color: Colors.red,
                                          //     shape: BoxShape.circle,
                                          //     image: DecorationImage(
                                          //         image: NetworkImage(""))),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("វណ្ណះ"),
                                            Text("2 day"),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(
                                      "ហេតុអ្វីបានជាទំស្រលាញ់ទាវ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                        "ទំព័រនេះត្រូវបានកែចុងក្រោយfdsjflkdsjfljdslfjdslfjdslfjdslfjisfsdjfjdslfsajlfjdsa;lfjsadlkfjនៅម៉ោងម៉ោង១៧:៥៩ ថ្ងៃសៅរ៍ ទី១៧ ខែកុម្ភៈ ឆ្នាំ២០១៨។អត្ថបទ​នេះ​ត្រូវ​បាន​ផ្ដល់​ក្រោម​អាជ្ញាបណ្ណ Creative Commons Attribution-ShareAlike License​ ។ លក្ខខណ្ឌបន្ថែម​ផ្សេងៗទៀតក៏នឹងអាចត្រូវបានអនុវត្ត។​សូមមើល លក្ខខណ្ឌ​ក្នុងការ​ប្រើប្រាស់ សម្រាប់​ព័ត៌មានលម្អិត​។"),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const PageSliy(),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: double.infinity,
                                child: PageView(
                                  onPageChanged: (id) {
                                    controller.onPageChanged(id);
                                  },
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 40,
                                        itemBuilder: (context, i) {
                                          return CustomAnswerCrad(
                                            isYourOwnQuestion: true,
                                            name: "ចាន់ថា",
                                            time: "១០​ថ្ងៃមុន",
                                            description:
                                                "អ្នកបានតាម សម្រាប់​ព័ត៌មានបន្ថែម)។ បើ​អ្នក​មក​ទីនេះដោយអចេតនា សូមចុចប៊ូតុង ត្រឡប់ក្រោយ របស់ឧបករណ៍រាវរករបស់អ្នក។",
                                            image: "",
                                            commentCount: "4",
                                            likeAnswer: "50",
                                            ontapProfile: () {
                                              debugPrint("13243");
                                              context.go('/profile');
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            avarta:
                                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/640px-Cat03.jpg',
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 40,
                                        itemBuilder: (context, i) {
                                          return CustomCommentCrad(
                                            ontap: () {},
                                            name: "vannak",
                                            time: "4h ago ",
                                            title:
                                                "ជួយបញ្ជាjlkjfajslkfdjlkafjjfklsjflkajsfljasfljsafdlក់បន្ថែមតិចមើលញុំដូចអត់សូវយល់",
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CommentScreen(
                      isAnswer: controller.isAnswer.value,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
