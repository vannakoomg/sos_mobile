import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_comment_crad.dart';

import '../../../utils/widgets/custom_answer_card.dart';
import '../widgets/page_sliy.dart';

class QuestionDetail extends StatefulWidget {
  const QuestionDetail({super.key});

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  @override
  void initState() {
    super.initState();
  }

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
          body: Obx(
        () => SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: AnimatedContainer(
                    decoration: const BoxDecoration(color: Colors.black),
                    padding: controller.isScale.value
                        ? const EdgeInsets.only(top: 3, left: 3, right: 3)
                        : const EdgeInsets.only(bottom: 70),
                    duration: const Duration(
                      milliseconds: 200,
                    ),
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
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.height,
                              placeholder: (context, url) => Container(
                                color: Colors.red,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            SizedBox(
                              height: 60,
                              child: Row(children: [
                                IconButton(
                                    onPressed: () {
                                      controller.isAnswer.value = false;
                                      context.pop();
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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(""))),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "វណ្ណះ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        "2 day",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: AppColor.textThird),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Gap(10),
                              Text(
                                "ហេតុអ្វីបានជាទំស្រលាញ់ទាវ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: AppColor.textThird),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Text(
                                ":៥៩ ថ្ងៃសៅរ៍ ទី១៧ ខែកុម្ភៈ ឆ្នាំ២០១៨។អត្ថប-ShareAlike Lice",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColor.textThird),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        PageSliy(
                          ontap: () {
                            controller.ontapChange();
                          },
                          isAnswer: controller.isAnswer.value,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          child: PageView(
                            controller: controller.pageController,
                            onPageChanged: (id) {
                              controller.onPageChanged();
                            },
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 40,
                                  itemBuilder: (context, i) {
                                    return CustomAnswerCrad(
                                      isCorrect: false,
                                      isYourOwnQuestion: true,
                                      name: "ចាន់ថា",
                                      time: "១០​ថ្ងៃមុន",
                                      description:
                                          "នេះដោយអចេតនា សូមចុចប៊ូតុង ត្រឡប់ក្រោយ របស់ឧបករណ៍រាវរករបស់អ្នក។",
                                      image:
                                          "https://www.shareicon.net/data/256x256/2016/05/26/771203_man_512x512.png",
                                      commentCount: "4",
                                      likeAnswer: "50",
                                      ontapProfile: () {
                                        debugPrint("13243");
                                        context.go('/profile');
                                      },
                                      ontapCorrect: () {
                                        debugPrint("khmer sl khmer ");
                                      },
                                      ontapComment: () {},
                                      avarta:
                                          "https://www.shareicon.net/data/256x256/2016/05/26/771203_man_512x512.png",
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
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
                        const Gap(90)
                      ],
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
