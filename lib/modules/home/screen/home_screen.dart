import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/search/screens/search_screen.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/controllers/singleTon.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_oops.dart';
import '../../../utils/widgets/custom_question_card.dart';
import '../../../utils/widgets/custom_textfield.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeContoller());
  final appController = Get.put(AppController());
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
          child: Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onPageChanged();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      height: 35,
                      curve: Curves.ease,
                      width: controller.isForYou.value == false
                          ? MediaQuery.of(context).size.width
                          : 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: !controller.isForYou.value
                            ? Theme.of(context).colorScheme.onTertiary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            left: controller.isForYou.value ? 0 : -90,
                            child: AnimatedOpacity(
                              opacity: controller.isForYou.value ? 1 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 2,
                                    right: 2,
                                  ),
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 70,
                                  child: Center(
                                    child: Text(
                                      "សំរាប់អ្នក",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                  )),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: const Duration(milliseconds: 400),
                            left: controller.isForYou.value ? 80 : 5,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8, left: 4, right: 4),
                                  child: AnimatedContainer(
                                    curve: Curves.easeInCirc,
                                    duration: Duration(
                                        milliseconds: !controller.isForYou.value
                                            ? 800
                                            : 500),
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  width: controller.searchText.value != ''
                                      ? MediaQuery.of(context).size.width - 80
                                      : MediaQuery.of(context).size.width,
                                  child: AnimatedOpacity(
                                    opacity: controller.isForYou.value ? 0 : 1,
                                    duration: const Duration(milliseconds: 300),
                                    child: CustomTextfield(
                                      contentPadding: const EdgeInsets.only(
                                        left: 4,
                                      ),
                                      isBorder: false,
                                      focusNode: myfocus,
                                      hintText: "ស្វែងរក",
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!,
                                      hintTextStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary),
                                      color: Colors.transparent,
                                      onChanged: (value) {
                                        controller.searchText.value = value;
                                        debugPrint(controller.searchText.value);
                                      },
                                      textEditController: controller
                                          .searchTextEditController.value,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.clearSearch();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.isLoading.value &&
                      controller.nextPage.value == 0 &&
                      controller.question.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: CustomLoading(),
                    ),
                  const Gap(5),
                  Expanded(
                      child: controller.isLoading.value &&
                              controller.nextPage.value == 0 &&
                              controller.question.isEmpty
                          ? const Center(
                              child: CustomLoading(),
                            )
                          : Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: PageView(
                                onPageChanged: (value) {
                                  unFocus(context);
                                  controller.isForYou.value =
                                      !controller.isForYou.value;
                                },
                                allowImplicitScrolling: true,
                                controller: controller.pageController,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: controller
                                                    .questionData.value.data !=
                                                null
                                            ? ListView.builder(
                                                padding: EdgeInsets.zero,
                                                controller: controller
                                                    .scrollController.value,
                                                itemCount:
                                                    controller.question.length,
                                                itemBuilder: (context, i) {
                                                  return CustomQuestionCard(
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
                                                    ontapQuestion: () {
                                                      Singleton.obj.questionId =
                                                          i;
                                                      context.pushNamed(
                                                          "question-detail",
                                                          pathParameters: {
                                                            "id": controller
                                                                .question[i].id
                                                                .toString()
                                                          });
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
        ),
      ),
    );
  }
}
