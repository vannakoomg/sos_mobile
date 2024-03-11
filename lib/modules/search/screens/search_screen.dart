import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';
import 'package:sos_mobile/modules/search/widgets/option_screen.dart';
import 'package:sos_mobile/utils/widgets/custom_book.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import '../controller/search_controller.dart';
import '../widgets/recent_search_widget.dart';

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
  final homeController = Get.put(HomeContoller());

  @override
  void initState() {
    controller.fetchPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Theme.of(context).colorScheme.background,
        child: !controller.isloading.value
            ? controller.popular.value.data != null
                ? Container(
                    color: Theme.of(context).colorScheme.background,
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
                                    Text("គំនិតខ្លះៗក្នុងការស្វ័យរក",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary)),
                                    Expanded(
                                      child: GridView.builder(
                                        itemCount: controller
                                            .popular.value.data!.length,
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 0,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Center(
                                            child: CustomBook(
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.5,
                                              height: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.5,
                                              ontap: () {},
                                              title: controller.popular.value
                                                      .data![index].title ??
                                                  '',
                                              image: controller.popular.value
                                                      .data![index].image ??
                                                  "",
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.isFocus && widget.searchText == '')
                                const SingleChildScrollView(
                                  padding: EdgeInsets.zero,
                                  child: AnimatedOpacity(
                                      duration: Duration(milliseconds: 300),
                                      opacity: 1,
                                      child: RecentSearchWidget()),
                                ),
                              if (widget.isFocus &&
                                  homeController.searchText.value != '')
                                OptionsSearch(ontapParagram: () {
                                  controller.tapSearch(
                                      context: context,
                                      name: widget.searchText,
                                      type: 1);
                                }, ontapTag: () {
                                  controller.tapSearch(
                                      context: context,
                                      name: widget.searchText,
                                      type: 0);
                                })
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container()
            : const CustomLoading(),
      ),
    );
  }
}
