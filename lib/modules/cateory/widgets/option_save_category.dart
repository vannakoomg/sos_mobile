import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/modules/cateory/controller/category_controller.dart';
import 'package:sos_mobile/modules/cateory/screens/edit_category_screen.dart';
import 'package:sos_mobile/modules/cateory/screens/merge_save_screen.dart';

class OptionSaveCategory extends StatelessWidget {
  final String categoryId;
  final int count;
  final String id;
  const OptionSaveCategory({
    super.key,
    required this.categoryId,
    required this.count,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      width: double.infinity,
      height: categoryController.saveCategory.value.data!.length > 1 ? 200 : 80,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.onTertiary,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (categoryController.saveCategory.value.data!.length > 1 &&
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
              onTap: () async {
                router.pop();
                await Future.delayed(const Duration(milliseconds: 100), () {
                  showModalBottomSheet(
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: ((context) {
                      return EditCategoryScreen(
                        coverUrl: "",
                        id: id,
                      );
                    }),
                  );
                });
              },
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
            if (categoryController.saveCategory.value.data!.length > 1)
              GestureDetector(
                onTap: () async {
                  await categoryController.deleteSaveCategory(id: categoryId);
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