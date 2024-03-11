import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/search/controller/recent_search_controller.dart';
import 'package:sos_mobile/modules/search/controller/search_controller.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recentSearchController = Get.put(RecentSearchController());
    final searchController = Get.put(Searchcontroller());
    recentSearchController.getRecentSearch();
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: recentSearchController.recentsearch.isNotEmpty
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.2,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        right: 10, left: 8, bottom: 10, top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RECETN",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                        ),
                        GestureDetector(
                          onTap: () {
                            recentSearchController.delectALL();
                          },
                          child: Container(
                            color: Colors.transparent,
                            child: Text(
                              "CLEAR",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                        children: recentSearchController.recentsearch
                            .asMap()
                            .entries
                            .map((e) {
                      return GestureDetector(
                        onTap: () {
                          searchController.tapSearch(
                              context: context,
                              type: e.value.type,
                              name: e.value.name);
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.only(left: 8, right: 5, top: 5),
                          alignment: Alignment.center,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  e.value.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: AppColor.textThird),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  recentSearchController.deleteOne(
                                      index: e.key, id: e.value.id);
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.close,
                                    color: AppColor.textThird,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                  ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
