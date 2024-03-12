import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/answer_comment_controller.dart';
import 'package:sos_mobile/modules/question/controller/answer_controller.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';
import 'package:sos_mobile/modules/question/screen/comment_screen.dart';
import 'package:sos_mobile/modules/question/screen/post_comment_answer_screen.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';
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
  final anwserController = Get.put(AnwserController());
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
                              color: Theme.of(context).colorScheme.background),
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
                                              controller.ontapMoreQuestion(
                                                context,
                                                widget.id,
                                                "https://scontent.fpnh18-1.fna.fbcdn.net/v/t39.30808-6/431967746_1147247899781283_6948626698840049783_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFYFFXM6TB_M8c68_698XMfQzjyCdtnriNDOPIJ22euI80W_Rv8Fe-fIbJotUNCFr_e9ZK56272vFA7sBv4qLSU&_nc_ohc=6ZqleNjb_NIAX9tO2Bs&_nc_zt=23&_nc_ht=scontent.fpnh18-1.fna&oh=00_AfC7WAjZu6SD48G-NfVsbhR9evDNTY7bJhNmm4MGQJnL5A&oe=65F1DABF",
                                              );
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
                                            Column(
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
                                                          color: AppColor
                                                              .textThird,
                                                          fontSize: 9),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Gap(10),
                                        Text(
                                          "ហេតុអ្វីបានជាទំស្រលាញ់ទាវ ?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        const SizedBox(
                                          height: 0,
                                        ),
                                        Text(
                                          ":៥៩ ថ្ងៃសៅរ៍ ទី១៧ ខែកុម្lsdlfadsdkfkdslksdlkdsalkdsaldsalalsksadkdskdsaksadlksdkkdskdsalkdsakdsaksadldsaldsaslfsadlkadslsafdlksdlkflssdlkfdsalklkdsaldsadsalkdslkmភៈ ឆ្នាំ២០១៨។អត្ថប-ShareAlike Lice",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
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
                                              return PostAnwserCommentScreen(
                                                id: widget.id,
                                              );
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
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                height: MediaQuery.of(context).size.height,
                                width: double.infinity,
                                child: PageView(
                                  allowImplicitScrolling: true,
                                  controller: controller.pageController,
                                  onPageChanged: (id) {
                                    controller.onPageChanged();
                                  },
                                  children: const [
                                    // AnwserScreen(id: widget.id),
                                    CommentScreen(),
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
    );
  }
}
