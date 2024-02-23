import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import 'package:sos_mobile/utils/widgets/custom_answer_card.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';
import 'package:sos_mobile/utils/widgets/custom_comment_crad.dart';
import '../widgets/page_sliy.dart';

class QuestionDetail extends StatefulWidget {
  final String id;
  const QuestionDetail({
    super.key,
    required this.id,
  });

  @override
  State<QuestionDetail> createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  final controller = QuestionDetailController();
  final commentController = AnswerCommentController();
  @override
  void initState() {
    controller.listenScoller();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: GestureDetector(
        onTap: () {
          commentController.isPost.value = false;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Obx(
              () => SafeArea(
                child: GestureDetector(
                  onDoubleTap: () {
                    controller.doubleTapScreen();
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          controller: controller.scrollerController01,
                          physics: !controller.isScroll.value ||
                                  controller.jumpAll.value
                              ? null
                              : const NeverScrollableScrollPhysics(),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.background),
                            padding: controller.isScale.value
                                ? const EdgeInsets.only(
                                    top: 3, left: 3, right: 3)
                                : const EdgeInsets.only(bottom: 70),
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            child: Column(
                              children: [
                                Column(
                                  key: controller.globalKey,
                                  children: [
                                    Stack(
                                      children: [
                                        // Container(
                                        //   margin:
                                        //       const EdgeInsets.only(bottom: 10),
                                        //   child: CustomCachedImageCircle(
                                        //     height: MediaQuery.sizeOf(context)
                                        //             .height *
                                        //         0.8,
                                        //     width: double.infinity,
                                        //     borderRadius:
                                        //         const BorderRadius.only(
                                        //             topLeft:
                                        //                 Radius.circular(20),
                                        //             topRight:
                                        //                 Radius.circular(20)),
                                        //     image:
                                        //         'https://i.pinimg.com/736x/d5/cb/83/d5cb8311c9d8f7f076c0475726c4913f.jpg',
                                        //   ),
                                        // ),
                                        SizedBox(
                                          child: Row(children: [
                                            IconButton(
                                                onPressed: () {
                                                  controller.isAnswer.value =
                                                      false;
                                                  context.pop();
                                                },
                                                icon: const Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.white,
                                                )),
                                            const Spacer(),
                                            IconButton(
                                              onPressed: () {
                                                controller
                                                    .ontapMoreQuestion(context);
                                              },
                                              icon: const Icon(
                                                Icons.more_horiz,
                                                color: Colors.white,
                                              ),
                                            )
                                          ]),
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  context.pushNamed(
                                                    '/user-profile',
                                                    pathParameters: {
                                                      "id": "2000"
                                                    },
                                                  );
                                                },
                                                child: const CustomCachedImageCircle(
                                                    image:
                                                        "https://imgs.search.brave.com/fC3UEKRpOZu3oOdDOt2oN26wQAfBIkCCXNakObNjz2o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE2/MDQwMjU4MjMwMTQt/NjM3OGIyNzI2MzM4/P3E9ODAmdz0xMDAw/JmF1dG89Zm9ybWF0/JmZpdD1jcm9wJml4/bGliPXJiLTQuMC4z/Jml4aWQ9TTN3eE1q/QTNmREI4TUh4elpX/RnlZMmg4TW54OFoy/bHliQ1V5TUdsdUpU/SXdaMnhoYzNObGMz/eGxibnd3Zkh3d2ZI/eDhNQT09"),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "វណ្ណះ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall,
                                                  ),
                                                  const Gap(3),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Text(
                                                      "2 day",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              color: AppColor
                                                                  .textThird,
                                                              fontSize: 9),
                                                    ),
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
                                                .copyWith(
                                                    color: AppColor.textThird),
                                          ),
                                          const SizedBox(
                                            height: 0,
                                          ),
                                          Text(
                                            ":៥៩ ថ្ងៃសៅរ៍ ទី១៧ ខែកុម្ភៈ ឆ្នាំ២០១៨។អត្ថប-ShareAlike Lice",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: AppColor.textThird),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              builder: (BuildContext context) {
                                                return const CommentScreen();
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.chat,
                                            size: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                      PageSliy(
                                        ontap: () {
                                          if (!controller.isScroll.value) {
                                            controller.scrollerController01
                                                .animateTo(
                                                    controller.hightOfBar.value,
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    curve: Curves.ease);
                                          }
                                          controller.ontapChange();
                                        },
                                        isAnswer: controller.isAnswer.value,
                                      ),
                                      GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            Icons.send_rounded,
                                            size: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  width: double.infinity,
                                  child: PageView(
                                    allowImplicitScrolling: true,
                                    controller: controller.pageController,
                                    onPageChanged: (id) {
                                      controller.onPageChanged();
                                    },
                                    children: [
                                      // Column(
                                      //   children: [
                                      //     const Gap(20),
                                      //     Text(
                                      //       "ពំុទាន់មានចម្លើយ !!!!",
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .bodyLarge!
                                      //           .copyWith(
                                      //               color: Theme.of(context)
                                      //                   .colorScheme
                                      //                   .onTertiary),
                                      //     ),
                                      //   ],
                                      // ),
                                      // Column(
                                      //   children: [
                                      //     const Gap(20),
                                      //     Text(
                                      //       "ពំុទាន់មានមតិ !!!!",
                                      //       style: Theme.of(context)
                                      //           .textTheme
                                      //           .bodyLarge!
                                      //           .copyWith(
                                      //               color: Theme.of(context)
                                      //                   .colorScheme
                                      //                   .onTertiary),
                                      //     ),
                                      //   ],
                                      // ),
                                      ListView.builder(
                                        controller:
                                            controller.scrollerController02,
                                        physics: controller.isScroll.value ||
                                                controller.jumpAll.value
                                            ? null
                                            : const NeverScrollableScrollPhysics(),
                                        itemCount: 20,
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
                                              debugPrint("khmer sl khmer ");
                                              context.pushNamed(
                                                '/user-profile',
                                                pathParameters: {"id": "2000"},
                                              );
                                            },
                                            ontapCorrect: () {
                                              debugPrint("khmer sl khmer ");
                                            },
                                            ontap: () {},
                                            avarta:
                                                "https://www.shareicon.net/data/256x256/2016/05/26/771203_man_512x512.png",
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        controller:
                                            controller.scrollerController03,
                                        physics: controller.isScroll.value ||
                                                controller.jumpAll.value
                                            ? null
                                            : const NeverScrollableScrollPhysics(),
                                        itemCount: 40,
                                        itemBuilder: (context, i) {
                                          return CustomCommentCrad(
                                            ontapProfile: () {
                                              context.pushNamed('/user-profile',
                                                  pathParameters: {
                                                    "id": "reer"
                                                  });
                                            },
                                            ontap: () {
                                              controller
                                                  .ontapMoreComment(context);
                                            },
                                            name: "vannak",
                                            time: "4h ago ",
                                            title:
                                                "ជួយបញ្ជាjlkjfajslkfdjlkafjjfklsjflkajsfljasfljsafdlក់បន្ថែមតិចមើលញុំដូចអត់សូវយល់",
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(90)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
