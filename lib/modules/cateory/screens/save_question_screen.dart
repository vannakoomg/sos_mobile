import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/modules/cateory/controller/category_controller.dart';
import 'package:sos_mobile/modules/cateory/controller/save_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_book.dart';

import '../../../configs/const/Colors/app_colors.dart';

class CreateSave extends StatefulWidget {
  final String questionId;
  const CreateSave({super.key, required this.questionId});

  @override
  State<CreateSave> createState() => _CreateSaveState();
}

class _CreateSaveState extends State<CreateSave> {
  final controller = Get.put(CategoryController());
  final saveController = Get.put(SaveController());
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
          padding: const EdgeInsets.only(top: 80, left: 10, right: 10),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        unFocus(context);
                        context.pop();
                      },
                      child: const Icon(Icons.close_rounded)),
                  Text(
                    "រក្សាទុកសំនួរ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Icon(
                    Icons.close_rounded,
                    color: Colors.transparent,
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "សៀវភៅរបស់អ្នក",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    const Gap(20),
                    if (controller.saveCategory.value.data != null)
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          children: controller.saveCategory.value.data!
                              .asMap()
                              .entries
                              .map((e) {
                            return GestureDetector(
                              onTap: () {
                                saveController.saveQuestion(
                                  e.value.id.toString(),
                                  widget.questionId,
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    CustomBook(
                                      image: "${e.value.cover}",
                                      size: 2,
                                      title: "",
                                      ontap: () {},
                                      height: 60,
                                      width: 45,
                                    ),
                                    const Gap(10),
                                    Expanded(
                                        child: Text(
                                      "${e.value.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                    GestureDetector(
                      onTap: () {
                        router.go('/home/create-save');
                      },
                      child: Container(
                        color: Theme.of(context).colorScheme.background,
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.secondnaryColor),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Gap(10),
                            Text(
                              "បង្កើតសៀវភៅ",
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
