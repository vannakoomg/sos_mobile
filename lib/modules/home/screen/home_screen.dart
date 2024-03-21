import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/search/controller/search_controller.dart';
import 'package:sos_mobile/modules/search/screens/search_screen.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/controllers/singleTon.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_oops.dart';
import '../../../utils/widgets/custom_question_card.dart';
import '../controllers/home_controller.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeContoller());
  final appController = Get.put(AppController());
  final searchController = Get.put(Searchcontroller());
  FocusNode myfocus = FocusNode();
  @override
  void initState() {
    controller.fetchQuestion(1);
    controller.scrollController.value.addListener(() {
      controller.listionScrollNavitionbar();
      controller.fetchQuestionNextPage();
    });
    myfocus.addListener(() {
      if (myfocus.hasFocus) {
        controller.isFocus.value = true;
      } else {
        controller.isFocus.value = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Obx(
        () => SafeArea(
          child: Stack(
            children: [
              Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      SaerchTextFile(
                        myfocus: myfocus,
                      ),
                      if (controller.isLoading.value &&
                          controller.nextPage.value == 0 &&
                          controller.question.isNotEmpty)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 20),
                          child: CustomLoading(),
                        ),
                      Expanded(
                          child: controller.isLoading.value &&
                                  controller.nextPage.value == 0 &&
                                  controller.question.isEmpty
                              ? const Center(
                                  child: CustomLoading(),
                                )
                              : Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: PageView(
                                    onPageChanged: (value) {
                                      unFocus(context);
                                      controller.isForYou.value =
                                          !controller.isForYou.value;
                                      searchController.fetchPopular();
                                    },
                                    allowImplicitScrolling: true,
                                    controller: controller.pageController,
                                    children: [
                                      Column(
                                        children: [
                                          Expanded(
                                            child: controller.questionData.value
                                                        .data !=
                                                    null
                                                ? ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    controller: controller
                                                        .scrollController.value,
                                                    itemCount: controller
                                                        .question.length,
                                                    itemBuilder: (context, i) {
                                                      return CustomQuestionCard(
                                                        onDoubleTap: () {
                                                          debugPrint(
                                                              "bong sl soy");
                                                        },
                                                        textHighlight: "យាយ",
                                                        questionId:
                                                            "${controller.question[i].id}",
                                                        istall: i % 2 != 0
                                                            ? false
                                                            : true,
                                                        title:
                                                            "${controller.question[i].title}",
                                                        tags: const [
                                                          "vv",
                                                          "vv",
                                                          "vv",
                                                          "vv",
                                                          "vv",
                                                          "vv",
                                                        ],
                                                        answerCount:
                                                            "${controller.question[i].amountAnswers}",
                                                        ontapQuestion:
                                                            () async {
                                                          Singleton.obj
                                                              .questionId = i;
                                                          context.pushNamed(
                                                            "question-detail",
                                                            pathParameters: {
                                                              "id": controller
                                                                  .question[i]
                                                                  .id
                                                                  .toString()
                                                            },
                                                          );
                                                        },
                                                        isCorrect: false,
                                                        descrition:
                                                            "${controller.question[i].description}",
                                                        image: "",
                                                        commentCount:
                                                            "${controller.question[i].amountComments}",
                                                        likeCount:
                                                            "${controller.question[i].amountAnswers}",
                                                      );
                                                    },
                                                  )
                                                : CustomOops(ontap: () {
                                                    controller.fetchQuestion(1);
                                                  }),
                                          ),
                                          if (controller.isLoading.value &&
                                              controller.nextPage.value > 0)
                                            const SizedBox(
                                              height: 100,
                                              child: Center(
                                                child: CustomLoading(),
                                              ),
                                            )
                                        ],
                                      ),
                                      SearchScreen(
                                        isFocus: controller.isFocus.value,
                                        searchText: controller.searchText.value,
                                      )
                                    ],
                                  ),
                                ))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
