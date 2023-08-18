import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/modules/settings/screens/setting_screen.dart';

import '../../question/widgets/answer_card.dart';

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

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _profileController.setdefultvalue();
    _profileController.getProfile();
    scrollerController01.addListener(() {
      if (scrollerController01.offset >= 289) {
        _profileController.isScroll.value = true;
      } else {
        _profileController.isScroll.value = false;
      }
      // scrollerController02.animateTo(0,
      //     curve: Curves.ease, duration: const Duration(milliseconds: 500));
      // scrollerController03.animateTo(0,
      //     curve: Curves.ease, duration: const Duration(milliseconds: 500));
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
    return Obx(() => Scaffold(
          backgroundColor: AppColor.mainColor,
          body: _profileController.isloadingProfile.value == true
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      // physics: _profileController.isScroll.value
                      //     ? const NeverScrollableScrollPhysics()
                      //     : null,
                      controller: scrollerController01,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () {
                                Get.to(const SettingScreen());
                              },
                              icon: const Icon(
                                Icons.settings,
                                color: Colors.white,
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
                                  color: Colors.black,
                                  image:
                                      _profileController.imagePath.value.path ==
                                              ''
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(
                                                File(_profileController
                                                    .imagePath.value.path),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                ),
                              )),
                          Text(
                            "${_profileController.profileDate.value.data!.fullNameKh}",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
                                      Text(
                                        "23",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const Text("ឆ្លើយ")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "3",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const Text("សំនួរ")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "43",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const Text("ចូលចិត្ត")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "4",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const Text("ចម្លើយត្រូវ")
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
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.ease);
                                  // scrollerController02.jumpTo(2);
                                  // scrollerController03.jumpTo(2);
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    AnimatedContainer(
                                      margin: EdgeInsets.only(
                                          left:
                                              _profileController.isAnswer.value
                                                  ? 2
                                                  : 68,
                                          top: 2),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: 36,
                                      width: _profileController.isAnswer.value
                                          ? 60
                                          : 50,
                                      decoration: BoxDecoration(
                                        color: AppColor.mainColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text("ឆ្លើយ")),
                                    const Positioned(
                                        right: 20, top: 10, child: Text("សួរ")),
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
                                  color: Colors.pink,
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
                                          CustomAnswerCrad(
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
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 5, right: 5),
                                  color: Colors.pink,
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
