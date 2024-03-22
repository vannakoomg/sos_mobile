// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/profile/widgets/profile.dart';
import 'package:sos_mobile/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_question_card.dart';

import '../../../utils/widgets/custom_answer_card.dart';

class UserProfileScreen extends StatefulWidget {
  String id;
  UserProfileScreen({super.key, required this.id});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

final controller = Get.put(UserProfileController());
final appController = Get.put(AppController());

class _UserProfileScreenState extends State<UserProfileScreen> {
  GlobalKey kkk = GlobalKey();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        controller.renderHihg.value = kkk.currentContext!.size!.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: SafeArea(
              child: Column(
                children: [
                  if (controller.renderHihg.value == 0)
                    Container(
                        key: kkk,
                        child: const Profile(
                          isUser: true,
                          showAnwser: false,
                        )),
                  if (controller.renderHihg.value != 0)
                    Expanded(
                      child: NestedScrollView(
                        controller: controller.scrollController.value,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return [
                            SliverAppBar(
                              titleSpacing: 0,
                              automaticallyImplyLeading: false,
                              scrolledUnderElevation: 0,
                              flexibleSpace: const FlexibleSpaceBar(
                                collapseMode: CollapseMode.pin,
                                background: Profile(
                                  isUser: true,
                                  // showAnwser: false,
                                  showTrueAnwser: false,
                                  showLike: false,
                                ),
                              ),
                              toolbarHeight: controller.renderHihg.value,
                              pinned: true,
                              floating: true,
                              expandedHeight: controller.renderHihg.value + 43,
                              bottom: PreferredSize(
                                preferredSize: const Size.fromHeight(43),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        width: 0.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                  )),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TabBar(
                                        labelPadding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        isScrollable: false,
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        indicatorColor:
                                            AppColor.secondnaryColor,
                                        padding: EdgeInsets.zero,
                                        indicatorPadding: EdgeInsets.zero,
                                        tabAlignment: TabAlignment.center,
                                        tabs: const [
                                          SizedBox(
                                            width: 50,
                                            height: 40,
                                            child: Center(
                                              child: Text("ចម្លើយ"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                            height: 40,
                                            child: Center(
                                              child: Text("សំនួរ"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ];
                        },
                        body: Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          child: TabBarView(
                            children: [
                              ListView.builder(
                                itemCount: 33,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, i) {
                                  return CustomAnswerCrad(
                                    isCorrect: false,
                                    isYourOwnQuestion: false,
                                    name: "ចាន់ថា",
                                    time: "១០​ថ្ងៃមុន",
                                    description: "234234",
                                    image: "",
                                    commentCount: "4",
                                    likeAnswer: "50",
                                    ontapProfile: () {
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
                                itemCount: 33,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, i) {
                                  return CustomQuestionCard(
                                    title: "kkdfkjjkdfkjjjkkkkk",
                                    answerCount: "2",
                                    isCorrect: false,
                                    questionId: '',
                                    image: '',
                                    likeCount: '',
                                    tags: const ["3", "3", "3"],
                                    commentCount: '',
                                    onDoubleTap: () {},
                                    ontapQuestion: () {},
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
