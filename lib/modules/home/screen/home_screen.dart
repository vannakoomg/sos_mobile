import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/search/screens/search_screen.dart';
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
  ScrollController scrollController = ScrollController();
  final controller = Get.put(HomeContoller());
  final appController = Get.put(AppController());

  FocusNode myfocus = FocusNode();

  @override
  void initState() {
    controller.fetchQuestion();
    scrollController.addListener(() {
      controller.scrollPixel.value = scrollController.offset;
      if (controller.oldScrollPixel.value > controller.scrollPixel.value) {
        controller.scrollPixalBack.value =
            controller.oldScrollPixel.value - controller.scrollPixel.value;
        if (controller.scrollPixalBack.value > controller.oldScrollback.value) {
          controller.oldScrollback.value = controller.scrollPixalBack.value;
        } else {
          controller.oldScrollPixel.value = controller.scrollPixel.value;
        }
      } else {
        controller.scrollPixalBack.value = 0;
        controller.oldScrollback.value = 0;
        controller.oldScrollPixel.value = controller.scrollPixel.value;
      }
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
    return Obx(
      () => SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: controller.isLoading.value == false
              ? Column(
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          controller.onPageChanged();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin:
                              const EdgeInsets.only(top: 20, left: 5, right: 5),
                          height: 40,
                          curve: Curves.ease,
                          width: controller.isForYou.value == false
                              ? MediaQuery.of(context).size.width
                              : 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                                      height: 36,
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
                                              .titleSmall!,
                                        ),
                                      )),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 400),
                                left: controller.isForYou.value ? 85 : 10,
                                top: 3,
                                child: Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 3,
                                      ),
                                      child: Icon(Icons.search_rounded),
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
                                          focusNode: myfocus,
                                          hintText: "ស្វែងរក",
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
                              controller: scrollController,
                              itemCount: 20,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onLongPressStart: (value) {
                                    appController.onlongPressStart(
                                        golbalDx: value.globalPosition.dx,
                                        golbalDy: value.globalPosition.dy,
                                        widthScreen:
                                            MediaQuery.of(context).size.width);
                                  },
                                  onLongPressMoveUpdate: (value) {
                                    appController.onLongPressMoveUpdate(
                                        globalDx: value.globalPosition.dx,
                                        globalDy: value.globalPosition.dy);
                                  },
                                  onLongPressEnd: (value) {
                                    appController.onLongPressEnd();
                                  },
                                  child: QuestionCard(
                                    ontap: () {
                                      context
                                          .go('/home-screen/question-detail');
                                    },
                                    questiondata:
                                        controller.homeData.value.data![1],
                                  ),
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
    );
  }
}
