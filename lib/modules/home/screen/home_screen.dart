import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/search/screens/search_screen.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
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
        () => Container(
          color: AppColor.mainColor,
          child: SafeArea(
            child: Container(
              color: AppColor.backgroundColor,
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
                            margin: const EdgeInsets.only(
                                top: 8, left: 5, right: 5),
                            height: 40,
                            curve: Curves.ease,
                            width: controller.isForYou.value == false
                                ? MediaQuery.of(context).size.width
                                : 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColor.secondnaryColor),
                              // color: AppColor.primaryColor.withOpacity(0.5),
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
                                                    color:
                                                        AppColor.primaryColor),
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
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width -
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
                                                    color: AppColor
                                                        .secondnaryColor),
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
                                  itemCount: 1,
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onLongPressStart: (value) {
                                        appController.onlongPressStart(
                                            golbalDx: value.globalPosition.dx,
                                            golbalDy: value.globalPosition.dy,
                                            widthScreen: MediaQuery.of(context)
                                                .size
                                                .width);
                                      },
                                      onLongPressMoveUpdate: (value) {
                                        appController.onLongPressMoveUpdate(
                                            globalDx:
                                                value.globalPosition.dx - 22,
                                            globalDy:
                                                value.globalPosition.dy - 22);
                                      },
                                      onLongPressEnd: (value) {
                                        appController.onLongPressEnd();
                                      },
                                      child: Container(
                                        height: 300,
                                        width: 400,
                                        color: Colors.red,
                                      ),
                                      // child: QuestionCard(
                                      //   ontap: () {
                                      //     context.go(
                                      //         '/home-screen/question-detail');
                                      //   },
                                      //   questiondata: controller.question[i],
                                      // ),
                                    );
                                  },
                                ),
                              ),
                              SearchScreen(
                                isFocus: controller.isFocus.value,
                                searchText: controller.searchText.value,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : const CustomLoading(),
            ),
          ),
        ),
      ),
    );
  }
}
