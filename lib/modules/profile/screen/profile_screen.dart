import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/modules/question/widgets/answer_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final scrollerController = ScrollController();
final scrollerController02 = ScrollController();
final scrollerController03 = ScrollController();
final _pageController = PageController();
final _profileController = Get.put(ProfileController());

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _profileController.setdefultvalue();
    _profileController.getProfile();
    scrollerController.addListener(() {
      if (scrollerController.offset > 340) {
        _profileController.isScroll.value = true;
        scrollerController.jumpTo(341); // make sur ta jol (if)
        scrollerController02.jumpTo(3);
        scrollerController03.jumpTo(3); // pel jol else
      } else {
        _profileController.isScroll.value = false;
      }
    });
    scrollerController02.addListener(() {
      debugPrint(scrollerController02.offset.toString());
      if (scrollerController02.offset < 1) {
        _profileController.isScroll.value = false;
        scrollerController.animateTo(50,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        scrollerController02.jumpTo(0); // make sur ta jol (if)
      } else {
        _profileController.isScroll.value = true;
      }
    });

    scrollerController03.addListener(() {
      debugPrint(scrollerController03.offset.toString());
      if (scrollerController03.offset < 1) {
        _profileController.isScroll.value = false;
        scrollerController.animateTo(50,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        scrollerController03.jumpTo(0); // make sur ta jol (if)
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
              ? const CircularProgressIndicator()
              : SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          GestureDetector(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                var image = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  _profileController.imagePath.value =
                                      File(image.path);
                                }
                              },
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.yellow,
                                  image:
                                      _profileController.imagePath.value.path ==
                                              ''
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(
                                                File(_profileController
                                                    .imagePath.value.path),
                                              ),
                                              fit: BoxFit.cover),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "កកដា",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8, right: 8),
                            height: 60,
                            decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(40)),
                            child: Row(children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "3",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                    child: Text(
                                  "23",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.black),
                                )),
                              ),
                              Expanded(
                                child: Center(
                                    child: Text(
                                  "43",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.black),
                                )),
                              ),
                              Expanded(
                                child: Center(
                                    child: Text(
                                  "4",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: Colors.black),
                                )),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.ease,
                            margin: EdgeInsets.only(
                                top:
                                    _profileController.isScroll.value ? 25 : 0),
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
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 160,
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
                                                  : 108,
                                          top: 2),
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height: 36,
                                      width: _profileController.isAnswer.value
                                          ? 100
                                          : 50,
                                      decoration: BoxDecoration(
                                        color: AppColor.mainColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    const Positioned(
                                        top: 10,
                                        left: 40,
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
                            height: MediaQuery.of(context).size.height,
                            child: PageView(
                              controller: _pageController,
                              allowImplicitScrolling: false,
                              onPageChanged: (value) {
                                _profileController.page.value = value;
                                _profileController.isAnswer.value =
                                    !_profileController.isAnswer.value;

                                scrollerController.animateTo(342,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeIn);
                              },
                              children: [
                                ListView(
                                  controller: scrollerController02,
                                  physics: _profileController.isScroll.value
                                      ? null
                                      : const NeverScrollableScrollPhysics(),
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Column(
                                        children: _profileController
                                            .profileDate.value.data!.answers!
                                            .asMap()
                                            .entries
                                            .map((e) {
                                          return CustomAnswerCrad(
                                              avarta:
                                                  "https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg",
                                              isYourOwnQuestion: true,
                                              name: "កក្ដដា",
                                              time: "២​ម៉ោងមុន",
                                              description:
                                                  e.value.description ?? '',
                                              title: "ប្រវត្តិសាស្រ្ត",
                                              image: const [],
                                              commentCount: "40",
                                              likeComment: "3",
                                              ontapProfile: () {
                                                debugPrint("nice to meet you");
                                                Get.toNamed('profile');
                                              },
                                              ontapCorrect: () {},
                                              ontapComment: () {},
                                              ontapDislikeComment: () {},
                                              ontapLikeComment: () {});
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                SingleChildScrollView(
                                  physics: _profileController.isScroll.value
                                      ? null
                                      : const NeverScrollableScrollPhysics(),
                                  controller: scrollerController03,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Column(
                                      children: [
                                        CustomAnswerCrad(
                                            avarta:
                                                "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                            isYourOwnQuestion: false,
                                            name: "សំណាង",
                                            time: "២​​ថ្ងៃមុន",
                                            description:
                                                "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                                            title: "ប្រវត្តិសាស្រ្ត",
                                            image: const [
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU"
                                            ],
                                            commentCount: "40",
                                            likeComment: "3",
                                            ontapProfile: () {
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            ontapDislikeComment: () {},
                                            ontapLikeComment: () {}),
                                        CustomAnswerCrad(
                                            avarta:
                                                "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                            isYourOwnQuestion: false,
                                            name: "សំណាង",
                                            time: "២​​ថ្ងៃមុន",
                                            description:
                                                "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                                            title: "ប្រវត្តិសាស្រ្ត",
                                            image: const [
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU"
                                            ],
                                            commentCount: "40",
                                            likeComment: "3",
                                            ontapProfile: () {
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            ontapDislikeComment: () {},
                                            ontapLikeComment: () {}),
                                        CustomAnswerCrad(
                                            avarta:
                                                "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                            isYourOwnQuestion: false,
                                            name: "សំណាង",
                                            time: "២​​ថ្ងៃមុន",
                                            description:
                                                "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                                            title: "ប្រវត្តិសាស្រ្ត",
                                            image: const [
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU"
                                            ],
                                            commentCount: "40",
                                            likeComment: "3",
                                            ontapProfile: () {
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            ontapDislikeComment: () {},
                                            ontapLikeComment: () {}),
                                        CustomAnswerCrad(
                                            avarta:
                                                "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                            isYourOwnQuestion: false,
                                            name: "សំណាង",
                                            time: "២​​ថ្ងៃមុន",
                                            description:
                                                "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                                            title: "ប្រវត្តិសាស្រ្ត",
                                            image: const [
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU"
                                            ],
                                            commentCount: "40",
                                            likeComment: "3",
                                            ontapProfile: () {
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            ontapDislikeComment: () {},
                                            ontapLikeComment: () {}),
                                        CustomAnswerCrad(
                                            avarta:
                                                "https://leadership.ng/wp-content/uploads/2023/03/davido.png",
                                            isYourOwnQuestion: false,
                                            name: "សំណាង",
                                            time: "២​​ថ្ងៃមុន",
                                            description:
                                                "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                                            title: "ប្រវត្តិសាស្រ្ត",
                                            image: const [
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1UlqB6vnCeTu-AZ0dzsQrhdWr1h58XOqpUQ&usqp=CAU"
                                            ],
                                            commentCount: "40",
                                            likeComment: "3",
                                            ontapProfile: () {
                                              debugPrint("nice to meet you 01");
                                            },
                                            ontapCorrect: () {},
                                            ontapComment: () {},
                                            ontapDislikeComment: () {},
                                            ontapLikeComment: () {}),
                                        const SizedBox(
                                          height: 150,
                                        ),
                                      ],
                                    ),
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
