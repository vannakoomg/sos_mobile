import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/screen/widgets/search_card.dart';
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
    debugPrint("app ${widget.searchText}");
    controller.fetchPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColor.mainColor,
        child: SafeArea(
          child: Container(
            color: AppColor.backgroundColor,
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        opacity: widget.isFocus ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: Column(
                          children: [
                            const Gap(10),
                            Text("ពេញនិយមក្នុងការស្វ័យរក ",
                                style:
                                    Theme.of(context).textTheme.titleMedium!),
                            const Gap(10),
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: GridView.builder(
                                  itemCount:
                                      controller.popular.value.data!.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 110,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return PopularCard(
                                        title: controller.popular.value
                                                .data![index].title ??
                                            '',
                                        image: controller.popular.value
                                                .data![index].image ??
                                            '',
                                        ontap: () {});
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SingleChildScrollView(
                      //   padding: EdgeInsets.zero,
                      //   child: AnimatedOpacity(
                      //     duration: const Duration(milliseconds: 300),
                      //     opacity:
                      //         widget.isFocus && widget.searchText == '' ? 1 : 0,
                      //     child: Container(
                      //       padding: const EdgeInsets.only(left: 10),
                      //       height: MediaQuery.of(context).size.height,
                      //       width: double.infinity,
                      //       color: AppColor.primaryColor,
                      //       child: Column(children: [
                      //         SizedBox(
                      //           height: 40,
                      //           child: Row(
                      //             children: [
                      //               Text(
                      //                 "សមីការឌឺក្រេទីពីរ ${controller.searchTextEditController.value.text}",
                      //                 style: Theme.of(context)
                      //                     .textTheme
                      //                     .bodyLarge!,
                      //               ),
                      //               const Spacer(),
                      //               IconButton(
                      //                   onPressed: () {
                      //                     unFocus(context);
                      //                     controller.deleteSaveSearch();
                      //                   },
                      //                   icon: const Icon(
                      //                     Icons.close,
                      //                   ))
                      //             ],
                      //           ),
                      //         )
                      //       ]),
                      //     ),
                      //   ),
                      // ),
                      // SingleChildScrollView(
                      //   padding: EdgeInsets.zero,
                      //   child: AnimatedOpacity(
                      //     duration: const Duration(milliseconds: 300),
                      //     opacity:
                      //         widget.isFocus && widget.searchText != '' ? 1 : 0,
                      //     child: Container(
                      //       padding: const EdgeInsets.only(
                      //         left: 8,
                      //       ),
                      //       height: MediaQuery.of(context).size.height,
                      //       width: double.infinity,
                      //       color: AppColor.mainColor,
                      //       child: const Column(
                      //         children: [
                      //           SizedBox(
                      //             height: 40,
                      //             child: Row(
                      //               children: [
                      //                 Icon(Icons.search),
                      //                 SizedBox(
                      //                   width: 10,
                      //                 ),
                      //                 Text("សមីការឌឺក្រេទីពីរsssss"),
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
