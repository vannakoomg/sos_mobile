import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_question_card.dart';

import '../../../utils/widgets/custom_answer_card.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key});
  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

final scrollerController01 = ScrollController();
final scrollerController02 = ScrollController();
final scrollerController03 = ScrollController();
final pageController = PageController();
final profileController = Get.put(OwnProfileController());
final appController = Get.put(AppController());

class _OwnProfileScreenState extends State<OwnProfileScreen> {
  @override
  void initState() {
    // profileController.getProfile();

    scrollerController01.addListener(() {
      debugPrint("value : ${scrollerController01.offset}");
      if (scrollerController01.offset >= 320) {
        scrollerController01
            .animateTo(320,
                curve: Curves.ease, duration: const Duration(milliseconds: 100))
            .then((value) {
          profileController.isScroll.value = true;
          scrollerController02.animateTo(1,
              curve: Curves.ease, duration: const Duration(milliseconds: 100));
          scrollerController03.animateTo(1,
              curve: Curves.ease, duration: const Duration(milliseconds: 100));
        });
      } else {
        profileController.isScroll.value = false;
      }
    });
    scrollerController02.addListener(() {
      debugPrint(scrollerController02.offset.toString());
      if (scrollerController02.offset == 0) {
        profileController.isScroll.value = false;
        scrollerController01.animateTo(0,
            curve: Curves.ease, duration: const Duration(milliseconds: 500));
        scrollerController03.jumpTo(0);
      } else {
        profileController.isScroll.value = true;
      }
    });
    scrollerController03.addListener(() {
      debugPrint(scrollerController03.offset.toString());
      if (scrollerController03.offset == 0) {
        profileController.isScroll.value = false;
        scrollerController01.animateTo(0,
            curve: Curves.ease, duration: const Duration(milliseconds: 500));
        scrollerController02.jumpTo(0);
      } else {
        profileController.isScroll.value = true;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return // profileController.isloadingProfile.value == true
        //     ? const CustomLoading()
        //     :
        Obx(() => Container(
              color: Theme.of(context).colorScheme.background,
              child: SafeArea(
                child: Container(
                  height: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                  child: SingleChildScrollView(
                    physics: profileController.isScroll.value
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    controller: scrollerController01,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            router.goNamed('setting');
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 35,
                            width: 35,
                            child: Center(
                              child: Icon(
                                Icons.settings_rounded,
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                size: 23,
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  profileController.pickImageProfile();
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.secondnaryColor,
                                  ),
                                )),
                            const Gap(10),
                            Text(
                              "វណ្ណះ",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Gap(10),
                            Text(
                              "ខ្មែរស្រលាញ់ខ្មែរ",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColor.textThird),
                            ),
                            const Gap(20),
                            Container(
                              margin: const EdgeInsets.only(left: 8, right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text("23",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!),
                                        Text("ឆ្លើយ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.textThird)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("3",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!),
                                        Text("សំនួរ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.textThird))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("43",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!),
                                        Text("ចូលចិត្ត",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.textThird))
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("4",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!),
                                        Text("ចម្លើយត្រូវ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColor.textThird))
                                      ],
                                    )
                                  ]),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.ease,
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    if (profileController.isAnswer.value) {
                                      pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.ease);
                                    } else {
                                      pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.ease);
                                    }
                                    if (!profileController.isScroll.value) {
                                      scrollerController01.animateTo(320,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    }
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                            // color: AppCol,
                                            border: Border.all(
                                                color:
                                                    AppColor.secondnaryColor),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      AnimatedContainer(
                                        margin: EdgeInsets.only(
                                            left:
                                                profileController.isAnswer.value
                                                    ? 4
                                                    : 66,
                                            top: 4),
                                        duration:
                                            const Duration(milliseconds: 400),
                                        height: 32,
                                        curve: Curves.easeOutQuart,
                                        width: profileController.isAnswer.value
                                            ? 60
                                            : 50,
                                        decoration: BoxDecoration(
                                          color: AppColor.secondnaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      Positioned(
                                          top: 10,
                                          left: 20,
                                          child: Text("ឆ្លើយ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!)),
                                      Positioned(
                                          right: 20,
                                          top: 10,
                                          child: Text(
                                            "សួរ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(10),
                            SizedBox(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height,
                              child: PageView(
                                allowImplicitScrolling: true,
                                controller: pageController,
                                onPageChanged: (value) {
                                  profileController.isAnswer.value =
                                      !profileController.isAnswer.value;
                                },
                                children: [
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: profileController.isScroll.value
                                        ? null
                                        : const NeverScrollableScrollPhysics(),
                                    controller: scrollerController02,
                                    itemCount: 40,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: [
                                          if (i == 0)
                                            const SizedBox(
                                              height: 2,
                                            ),
                                          GestureDetector(
                                            onLongPressStart: (value) {
                                              appController.onlongPressStart(
                                                  golbalDx:
                                                      value.globalPosition.dx,
                                                  golbalDy:
                                                      value.globalPosition.dy,
                                                  widthScreen:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  id: "");
                                            },
                                            onLongPressMoveUpdate: (value) {
                                              appController
                                                  .onLongPressMoveUpdate(
                                                      globalDx: value
                                                          .globalPosition.dx,
                                                      globalDy: value
                                                          .globalPosition.dy);
                                            },
                                            onLongPressEnd: (value) {
                                              appController
                                                  .onLongPressEnd(context);
                                            },
                                            child: CustomAnswerCrad(
                                              isCorrect: false,
                                              avarta:
                                                  "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                              isYourOwnQuestion: false,
                                              name: "សំណាង",
                                              time: "២​​ថ្ងៃមុន",
                                              description: "B sl soyb",
                                              image:
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU",
                                              commentCount: "40",
                                              likeAnswer: "3",
                                              ontapProfile: () {
                                                debugPrint(
                                                    "nice to meet you 01");
                                              },
                                              ontapCorrect: () {},
                                              ontap: () {},
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: profileController.isScroll.value
                                        ? null
                                        : const NeverScrollableScrollPhysics(),
                                    itemCount: 40,
                                    controller: scrollerController03,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        children: [
                                          if (i == 0)
                                            const SizedBox(
                                              height: 2,
                                            ),
                                          CsutomQuestionCard(
                                            questionId: "",
                                            isCorrect: false,
                                            time: "២​​ថ្ងៃមុន",
                                            descrition: "B sl soyb",
                                            image:
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU",
                                            commentCount: "40",
                                            tags: const ["2", "2", "2"],
                                            title: 'khmer sl khmer',
                                            likeCount: '30k',
                                            answerCount: '68',
                                            ontapQuestion: () {},
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
