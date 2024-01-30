import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
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
            child: controller.isLoading.value == false ||
                    controller.nextPage.value != 0
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.onPageChanged();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin:
                              const EdgeInsets.only(top: 8, left: 5, right: 5),
                          height: 40,
                          curve: Curves.ease,
                          width: controller.isForYou.value == false
                              ? MediaQuery.of(context).size.width
                              : 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.secondnaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 400),
                                left: controller.isForYou.value ? 0 : -90,
                                top: 0,
                                child: AnimatedOpacity(
                                  opacity: controller.isForYou.value ? 1 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 2, right: 2, top: 2),
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: AppColor.secondnaryColor
                                              .withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 70,
                                      child: Center(
                                        child: Text(
                                          "សំរាប់អ្នក",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  color: AppColor.primaryColor),
                                        ),
                                      )),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 400),
                                left: controller.isForYou.value ? 80 : 2,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                      ),
                                      child: AnimatedContainer(
                                        curve: Curves.easeInCirc,
                                        duration: Duration(
                                            milliseconds:
                                                !controller.isForYou.value
                                                    ? 800
                                                    : 500),
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(
                                          Icons.search_rounded,
                                          color: AppColor.secondnaryColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: controller.searchText.value != ''
                                          ? MediaQuery.of(context).size.width -
                                              80
                                          : MediaQuery.of(context).size.width,
                                      child: AnimatedOpacity(
                                        opacity:
                                            controller.isForYou.value ? 0 : 1,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child: CustomTextfield(
                                          isBorder: false,
                                          focusNode: myfocus,
                                          hintText: "ស្វែងរក",
                                          hintTextStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color:
                                                      AppColor.secondnaryColor),
                                          color: Colors.transparent,
                                          onChanged: (value) {},
                                          textEditController: null,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.filter_list,
                                      color: Colors.black,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          onPageChanged: (value) {
                            unFocus(context);
                            controller.isForYou.value =
                                !controller.isForYou.value;
                          },
                          allowImplicitScrolling: true,
                          controller: controller.pageController,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  right: 5, left: 5, top: 10),
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                controller: controller.scrollController.value,
                                itemCount: controller.question.length,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onLongPressStart: (value) {
                                      appController.onlongPressStart(
                                        golbalDx: value.globalPosition.dx,
                                        golbalDy: value.globalPosition.dy,
                                        widthScreen:
                                            MediaQuery.sizeOf(context).width,
                                        id: controller.question[i].id
                                            .toString(),
                                      );
                                    },
                                    onLongPressMoveUpdate: (value) {
                                      appController.onLongPressMoveUpdate(
                                          globalDx:
                                              value.globalPosition.dx - 22,
                                          globalDy:
                                              value.globalPosition.dy - 22);
                                    },
                                    onLongPressEnd: (value) {
                                      appController.onLongPressEnd(context);
                                    },
                                    child: CsutomQuestionCard(
                                      title: "ហេតុអ្វីបានជាទុំស្រលាញ់ទាវ?",
                                      tags: const [
                                        "dfa2341241344334534534534sfd",
                                        "dfa2341241344334534534534sfd",
                                      ],
                                      answerCount: "0",
                                      ontapQuestion: () {
                                        debugPrint("dfdf");
                                        router.go("/home/question-detail");
                                      },
                                      isCorrect: false,
                                      avarta:
                                          'https://hips.hearstapps.com/hmg-prod/images/index-avatar3-1672251913.jpg?crop=0.502xw:1.00xh;0.210xw,0&resize=1200:*',
                                      name: "b nak",
                                      time: '2h ago',
                                      descrition:
                                          'កម្រងសៀវភៅ ប្រជុំរឿងព្រេងខ្មែរ ត្រូវ​បាន​បែង​ចែក​ជា​៩​ភាគ ដោយ​ក្នុង​នោះ​មាន​រឿង​សុរប​២៤៨ ស្ដី​អំពី​រឿង​ព្រេង​នានា​ផ្ដល់​ការ​អប់រំ ទាក់​ទង​នឹង​ភូមិសាស្ត្រ ព្រម​ទាំង​ប្រវត្តិសាស្ត្រ​ក្នុង​ប្រទេស​កម្ពុជា។ សៀវភៅ​ប្រជុំ​រឿង​ព្រេង​នេះ​ត្រូវ​បាន​បោះពុម្ព​លើក​ដំបូង​នៅ​ក្នុង​កំឡុង​ទសវត្សរ៍​ឆ្នាំ​១៩៦០ ដោយ​វិទ្យាស្ថាន​ពុទ្ធសាសនបណ្ឌិត្យ។',
                                      image:
                                          'https://hips.hearstapps.com/hmg-prod/images/index-avatar3-1672251913.jpg?crop=0.502xw:1.00xh;0.210xw,0&resize=1200:*',
                                      commentCount: '0',
                                      likeCount: '8',
                                      ontapProfile: () {},
                                    ),
                                  );
                                },
                              ),
                            ),
                            // SearchScreen(
                            //   isFocus: controller.isFocus.value,
                            //   searchText: controller.searchText.value,
                            // )
                          ],
                        ),
                      ),
                    ],
                  )
                : const CustomLoading(),
          ),
        ),
      ),
    );
  }
}
