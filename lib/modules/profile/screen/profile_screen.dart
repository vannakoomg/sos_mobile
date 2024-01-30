import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';

import '../../../utils/widgets/custom_answer_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final scrollerController01 = ScrollController();
final scrollerController02 = ScrollController();
final scrollerController03 = ScrollController();
final _pageController = PageController();
final _profileController = Get.put(ProfileController());
final appController = Get.put(AppController());

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // _profileController.getProfile();
    scrollerController01.addListener(() {
      if (scrollerController01.offset >= 289) {
        _profileController.isScroll.value = true;
      } else {
        _profileController.isScroll.value = false;
      }
      scrollerController02.animateTo(0,
          curve: Curves.ease, duration: const Duration(milliseconds: 500));
      scrollerController03.animateTo(0,
          curve: Curves.ease, duration: const Duration(milliseconds: 500));
    });
    scrollerController02.addListener(() {
      debugPrint(scrollerController02.offset.toString());
      if (scrollerController02.offset == 0) {
        _profileController.isScroll.value = false;
      } else {
        _profileController.isScroll.value = true;
      }
    });
    scrollerController03.addListener(() {
      debugPrint(scrollerController03.offset.toString());
      if (scrollerController03.offset == 0) {
        _profileController.isScroll.value = false;
      } else {
        _profileController.isScroll.value = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return // _profileController.isloadingProfile.value == true
        //     ? const CustomLoading()
        //     :
        Obx(() => Container(
              color: Theme.of(context).colorScheme.background,
              child: SafeArea(
                child: Container(
                  height: double.infinity,
                  color: Theme.of(context).colorScheme.background,
                  child: SingleChildScrollView(
                    controller: scrollerController01,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              context.go('/home/setting');
                            },
                            icon: Icon(
                              Icons.settings,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _profileController.pickImageProfile();
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColor.primaryColor, width: 3),
                                color: AppColor.secondnaryColor,
                              ),
                              // child: _profileController.imagePath.value.path == ''
                              //     ? Center(
                              //         child: Text(_profileController.profileDate
                              //             .value.data!.fullNameKh![0]),
                              //       )
                              //     : Image.network(""),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                _profileController.isAnswer.value =
                                    !_profileController.isAnswer.value;
                                if (_profileController.isAnswer.value) {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                } else {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.ease);
                                }
                                scrollerController01.animateTo(290,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.ease);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        border: Border.all(
                                            color: AppColor.secondnaryColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        left: _profileController.isAnswer.value
                                            ? 4
                                            : 66,
                                        top: 4),
                                    duration: const Duration(milliseconds: 400),
                                    height: 32,
                                    curve: Curves.easeOutQuart,
                                    width: _profileController.isAnswer.value
                                        ? 60
                                        : 50,
                                    decoration: BoxDecoration(
                                      color: AppColor.secondnaryColor,
                                      borderRadius: BorderRadius.circular(20),
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
                                            .titleSmall,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - 180,
                          child: PageView(
                            allowImplicitScrolling: true,
                            controller: _pageController,
                            onPageChanged: (value) {
                              _profileController.page.value = value;
                              _profileController.isAnswer.value =
                                  !_profileController.isAnswer.value;
                            },
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ListView.builder(
                                  physics: _profileController.isScroll.value
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
                                            appController.onLongPressMoveUpdate(
                                                globalDx:
                                                    value.globalPosition.dx,
                                                globalDy:
                                                    value.globalPosition.dy);
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
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                child: ListView.builder(
                                  physics: _profileController.isScroll.value
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
                                        CustomAnswerCrad(
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
                                            debugPrint("nice to meet you 01");
                                          },
                                          ontapCorrect: () {},
                                          ontapComment: () {},
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
