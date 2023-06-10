import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/question/controller/question_detail_controller.dart';

import '../widgets/answer_card.dart';

class QuestionDetail extends StatelessWidget {
  const QuestionDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionDetailController());
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: 'image',
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://i.pinimg.com/736x/d5/cb/83/d5cb8311c9d8f7f076c0475726c4913f.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.height,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 20),
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
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                                image:
                                    DecorationImage(image: NetworkImage(""))),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("វណ្ណះ"),
                              Text("2 day"),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "ហេតុអ្វីបានជាទំស្រលាញ់ទាវ",
                        style: Theme.of(context).textTheme.titleSmall,
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
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        controller.isAnswer.value = !controller.isAnswer.value;
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
                            left: controller.isAnswer.value == true ? 2 : 112,
                            duration: const Duration(milliseconds: 250),
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
                                Text("Answer"),
                                Text("Comment"),
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
                  isYourOwnQuestion: true,
                  name: "ចាន់ថា",
                  time: "១០​ថ្ងៃមុន",
                  title: "ដោយសារការស្រលាញ់",
                  description:
                      "អ្នកបានតាម​តំណភ្ជាប់​ទៅ​ទំព័រដែលមិនទាន់មាននៅឡើយ។ ដើម្បីបង្កើតទំព័រនេះ សូមចាប់ផ្ដើមវាយ​ក្នុងប្រអប់ខាងក្រោម (សូមមើល ទំព័រ​ជំនួយ សម្រាប់​ព័ត៌មានបន្ថែម)។ បើ​អ្នក​មក​ទីនេះដោយអចេតនា សូមចុចប៊ូតុង ត្រឡប់ក្រោយ របស់ឧបករណ៍រាវរករបស់អ្នក។",
                  image: const [
                    "https://upload.wikimedia.org/wikipedia/commons/7/72/Angkor_wat_temple.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/6/6c/Angkor_Wat_from_north_pond.JPG"
                  ],
                  commentCount: "4",
                  likeComment: "50",
                  ontapProfile: () {},
                  ontapCorrect: () {},
                  ontapComment: () {},
                  ontapDislikeComment: () {},
                  ontapLikeComment: () {},
                  avarta: '',
                ),
                CustomAnswerCrad(
                  isYourOwnQuestion: true,
                  name: "ចាន់ថា",
                  time: "១០​ថ្ងៃមុន",
                  title: "ដោយសារការស្រលាញ់",
                  description:
                      "អ្នកបានតាម​តំណភ្ជាប់​ទៅ​ទំព័រដែលមិនទាន់មាននៅឡើយ។ ដើម្បីបង្កើតទំព័រនេះ សូមចាប់ផ្ដើមវាយ​ក្នុងប្រអប់ខាងក្រោម (សូមមើល ទំព័រ​ជំនួយ សម្រាប់​ព័ត៌មានបន្ថែម)។ បើ​អ្នក​មក​ទីនេះដោយអចេតនា សូមចុចប៊ូតុង ត្រឡប់ក្រោយ របស់ឧបករណ៍រាវរករបស់អ្នក។",
                  image: const [
                    "https://upload.wikimedia.org/wikipedia/commons/7/72/Angkor_wat_temple.jpg",
                    "https://upload.wikimedia.org/wikipedia/commons/6/6c/Angkor_Wat_from_north_pond.JPG"
                  ],
                  commentCount: "4",
                  likeComment: "50",
                  ontapProfile: () {},
                  ontapCorrect: () {},
                  ontapComment: () {},
                  ontapDislikeComment: () {},
                  ontapLikeComment: () {},
                  avarta: '',
                ),
                // PageView(
                //   children: [
                //     const Column(
                //       children: [
                //         CustomCommentCrad(
                //             name: "កញ្ញា",
                //             time: '3h ',
                //             title:
                //                 "B sl dfdsfkjdslkfjlkdsfjlkdsjflkjdslfkjdslkfjlkdsjflkdsjflkjdslkfjldskfjlkdsjflksdjflkjsdflkjkdjsfkjdskjlsdjljdsljdflkjdsljfjdslfkjdslkjfsdjfsjdsoy "),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         CustomCommentCrad(
                //             name: "តុលា",
                //             time: '3h ',
                //             title: "khmer sl khmer "),
                //       ],
                //     ),
                //     CustomAnswerCrad(
                //       isYourOwnQuestion: true,
                //       name: "ចាន់ថា",
                //       time: "១០​ថ្ងៃមុន",
                //       title: "ដោយសារការស្រលាញ់",
                //       description:
                //           "អ្នកបានតាម​តំណភ្ជាប់​ទៅ​ទំព័រដែលមិនទាន់មាននៅឡើយ។ ដើម្បីបង្កើតទំព័រនេះ សូមចាប់ផ្ដើមវាយ​ក្នុងប្រអប់ខាងក្រោម (សូមមើល ទំព័រ​ជំនួយ សម្រាប់​ព័ត៌មានបន្ថែម)។ បើ​អ្នក​មក​ទីនេះដោយអចេតនា សូមចុចប៊ូតុង ត្រឡប់ក្រោយ របស់ឧបករណ៍រាវរករបស់អ្នក។",
                //       image: const [
                //         "https://upload.wikimedia.org/wikipedia/commons/7/72/Angkor_wat_temple.jpg",
                //         "https://upload.wikimedia.org/wikipedia/commons/6/6c/Angkor_Wat_from_north_pond.JPG"
                //       ],
                //       commentCount: "4",
                //       likeComment: "50",
                //       ontapProfile: () {},
                //       ontapCorrect: () {},
                //       ontapComment: () {},
                //       ontapDislikeComment: () {},
                //       ontapLikeComment: () {},
                //       avarta: '',
                //     )
                //   ],
                // ),
                const SizedBox(
                  height: 100,
                )
                // const SizedBox(
                //   height: 60,
                // )
              ],
            ),
          ),
        ));
  }
}
