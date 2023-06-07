import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/profile/controllers/profile_controller.dart';
import 'package:sos_mobile/modules/question/widgets/answer_card.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SizedBox(
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
                      // var image =
                      //     await picker.pickImage(source: ImageSource.gallery);
                      // _profileController.listImage.clear();
                      var imagee = await picker.pickMultiImage();
                      // imagee.map((e) {
                      //   _profileController.listImage.add(File(e.path));
                      // }).toList();

                      _profileController.imagePath.value = File(imagee[0].path);
                      // debugPrint(
                      //     "image path ${_profileController.listImage[0]}");
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        image: _profileController.imagePath.value.path == ''
                            ? null
                            : DecorationImage(
                                image: FileImage(
                                  File(_profileController.imagePath.value.path),
                                ),
                                fit: BoxFit.cover),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "ដារ៉ា",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
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
                  height: 10,
                ),
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // controller.isAnswer.value = !controller.isAnswer.value;
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 35,
                            width: 214,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          AnimatedPositioned(
                            top: 2.5,
                            left: 2,
                            // left: controller.isAnswer.value == true ? 2 : 112,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppColor.mainColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 214,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("ឆ្លើយ"),
                                Text("សួរ"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomAnswerCrad(
                    avarta:
                        "https://newprofilepic2.photo-cdn.net//assets/images/article/profile.jpg",
                    isYourOwnQuestion: true,
                    name: "កក្ដដា",
                    time: "២​ម៉ោងមុន",
                    description:
                        "សូម ស្វាគម មកកាន់ 'ផតថលសហគម! ទីនេះ ជាបន្ទប់ពិភាក្សា ផ្លាស់ប្ដូរមតិយោបល់ ក៏ដោយជាការស្នើសុំនានា ព្រមទាំងការផ្ដួចផ្ដើមគំនិតលើគម្រោងនានា សំរាប់វចនានុក្រមវិគីភាសាខ្មែរយើង។ អ្នកអាចសរសេរនៅទីនេះបាន។ សូមអរគុណ!",
                    title: "ប្រវត្តិសាស្រ្ត",
                    image: const [],
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
                  height: 10,
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
