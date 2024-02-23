import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';

class MergeSaveScreen extends StatefulWidget {
  final String categoryId;
  const MergeSaveScreen({super.key, required this.categoryId});
  @override
  State<MergeSaveScreen> createState() => _MergeSaveScreenState();
}

class _MergeSaveScreenState extends State<MergeSaveScreen> {
  final controller = Get.put(SaveCategoryController());
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200), () {
      controller.fetchSaveCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.only(top: 80, left: 5, right: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          height: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(
                          Icons.close,
                        )),
                    Text(
                      "សៀវភៅ",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Icon(
                      Icons.close,
                      color: Colors.transparent,
                    )
                  ],
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "សៀវភៅរបស់អ្នក",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Gap(10),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: controller.saveCategory.value.data!
                              .asMap()
                              .entries
                              .map((e) {
                            return e.value.id != int.parse(widget.categoryId)
                                ? GestureDetector(
                                    onTap: () {
                                      controller.mergeSaveCategory(
                                          fromId: widget.categoryId,
                                          toId: e.value.id.toString(),
                                          context: context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          const Gap(10),
                                          Expanded(
                                              child: Text(
                                            "${e.value.name}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox();
                          }).toList(),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
