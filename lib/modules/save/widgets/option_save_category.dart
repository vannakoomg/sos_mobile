import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/modules/save/controller/save_category_controller.dart';
import 'package:sos_mobile/modules/save/screens/merge_save_screen.dart';

class OptionSaveCategory extends StatelessWidget {
  final String categoryId;
  final int count;
  const OptionSaveCategory({
    super.key,
    required this.categoryId,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final saveCategoryController = Get.put(SaveCategoryController());
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      height:
          saveCategoryController.saveCategory.value.data!.length > 1 ? 200 : 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColor.textThird,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (saveCategoryController.saveCategory.value.data!.length > 1 &&
                count > 0)
              GestureDetector(
                onTap: () async {
                  router.pop();
                  await Future.delayed(const Duration(milliseconds: 100), () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: ((context) {
                        return MergeSaveScreen(categoryId: categoryId);
                      }),
                    );
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.transparent,
                  child: Text(
                    "ប្ដូរសៀវភៅ",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.textSec),
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Colors.transparent,
                child: Text(
                  "កែប្រែ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.textSec),
                ),
              ),
            ),
            if (saveCategoryController.saveCategory.value.data!.length > 1)
              GestureDetector(
                onTap: () async {
                  await saveCategoryController.deleteSaveCategory(
                      id: categoryId);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.transparent,
                  child: Text(
                    "លុប",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColor.textSec),
                  ),
                ),
              )
          ]),
    );
  }
}
