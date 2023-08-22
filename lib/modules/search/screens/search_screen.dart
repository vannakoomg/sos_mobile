import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/screen/widgets/search_card.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';

import '../controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  final bool isFocus;
  final String searchText;
  const SearchScreen(
      {super.key, required this.isFocus, required this.searchText});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = Get.put(Searchcontroller());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(),
        color: AppColor.mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Stack(
                children: [
                  // AnimatedContainer(
                  //   width:widget. isFocus
                  //       ? MediaQuery.of(context).size.width - 50
                  //       : MediaQuery.of(context).size.width - 16,
                  //   duration: const Duration(milliseconds: 200),
                  //   margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  //   child: CustomTextfield(
                  //     focusNode: myfocus,
                  //     hintText: "Search",
                  //     onChanged: (value) {
                  //       controller.searchText.value = value;
                  //     },
                  //     textEditController:
                  //         controller.searchTextEditController.value,
                  //   ),
                  // ),
                  // AnimatedPositioned(
                  //   top: 25,
                  //   right: controller.isFocus.value ? 10 : -22,
                  //   duration: const Duration(milliseconds: 200),
                  //   curve: Curves.ease,
                  //   child: GestureDetector(
                  //       onTap: () {
                  //         controller.delete();
                  //       },
                  //       child: const Text("លុប")),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: widget.isFocus ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Text(
                            "ពេញនិយមក្នុងការស្វ័យរក ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin:
                                const EdgeInsets.only(left: 2.5, right: 2.5),
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
                    padding: EdgeInsets.zero,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                          widget.isFocus && widget.searchText == '' ? 1 : 0,
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
                                Text(
                                    "សមីការឌឺក្រេទីពីរ ${controller.searchTextEditController.value.text}"),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      unFocus(context);
                                      controller.deleteSaveSearch();
                                    },
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity:
                          widget.isFocus && widget.searchText != '' ? 1 : 0,
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
