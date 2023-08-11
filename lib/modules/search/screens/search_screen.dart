import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/screen/widgets/search_card.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode myfocus = FocusNode();
  final controller = Get.put(Searchcontroller());

  @override
  void initState() {
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
      () => Container(
        margin: const EdgeInsets.only(top: 75, left: 0, right: 0),
        height: double.infinity,
        width: double.infinity,
        color: AppColor.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: controller.isFocus.value
                        ? MediaQuery.of(context).size.width - 50
                        : MediaQuery.of(context).size.width - 16,
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: CustomTextfield(
                      focusNode: myfocus,
                      hintText: "Search",
                      onChanged: (value) {
                        controller.searchText.value = value;
                      },
                      textEditController:
                          controller.searchTextEditController.value,
                    ),
                  ),
                  AnimatedPositioned(
                    top: 10,
                    right: controller.isFocus.value ? 10 : -22,
                    duration: const Duration(milliseconds: 300),
                    child: const Text("លុប"),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: controller.isFocus.value ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "ពេញនិយមក្នុងការស្វ័យរក ${controller.searchText.value}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Wrap(
                              children: [
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                                SearchCrad(
                                  title: "សំនួរមិនមានអ្នកឆ្លើយ",
                                  image:
                                      "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                                  ontap: () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: controller.isFocus.value &&
                              controller.searchText.value == ''
                          ? 1
                          : 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        color: AppColor.mainColor,
                        child: Column(children: [
                          SizedBox(
                            height: 40,
                            child: Row(
                              children: [
                                const Icon(Icons.search),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text("សមីការឌឺក្រេទីពីរ"),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: controller.isFocus.value &&
                              controller.searchText.value != ''
                          ? 1
                          : 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        color: AppColor.mainColor,
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  Icon(Icons.search),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("សមីការឌឺក្រេទីពីរ"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
