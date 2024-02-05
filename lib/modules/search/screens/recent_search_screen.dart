import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/search/controller/search_controller.dart';
import 'package:sos_mobile/modules/search/model/recent_search_model.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Searchcontroller());
    return Obx(
      () => Container(
        padding: const EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: controller.recentSearch.value.data != null &&
                controller.recentSearch.value.data!.isNotEmpty
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 0.2,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ))),
                    // margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, bottom: 10, top: 3),
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
                            controller.deleteAll().then((value) {
                              controller.recentSearch.value =
                                  RecentSearchModel();
                            });
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
                    margin: const EdgeInsets.only(left: 20, right: 15, top: 5),
                    child: Column(
                        children: controller.recentSearch.value.data!
                            .asMap()
                            .entries
                            .map((e) {
                      return Container(
                        alignment: Alignment.center,
                        // color: Colors.pink,
                        height: 40,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${e.value.name}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: AppColor.textThird),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.recentSearch.value.data!
                                    .removeAt(e.key);
                                controller.deleteRecentSearch(e.value.id!);
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
