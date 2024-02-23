import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

class SaveCategoryScreen extends StatefulWidget {
  const SaveCategoryScreen({super.key});

  @override
  State<SaveCategoryScreen> createState() => _SaveCategoryScreenState();
}

class _SaveCategoryScreenState extends State<SaveCategoryScreen> {
  final controller = Get.put(SaveCategoryController());
  @override
  void initState() {
    controller.fetchSaveCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).height,
          child: SafeArea(
            child: Column(
              children: [
                Text("រក្សាទុក",
                    style: Theme.of(context).textTheme.titleLarge!),
                const Gap(30),
                Expanded(
                  child: !controller.isloading.value
                      ? controller.saveCategory.value.data != null
                          ? GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30,
                              ),
                              itemCount:
                                  controller.saveCategory.value.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.title.value = controller
                                            .saveCategory
                                            .value
                                            .data![index]
                                            .name ??
                                        "";
                                    controller.index.value = index;
                                    context.goNamed(
                                      'save-detail',
                                      pathParameters: {
                                        "id": controller
                                            .saveCategory.value.data![index].id
                                            .toString()
                                      },
                                    );
                                  },
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Transform.rotate(
                                          angle: 0.12,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 12, top: 4),
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                3,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: AppColor.mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: AppColor.primaryColor),
                                            ),
                                          ),
                                        ),
                                        Transform.rotate(
                                          angle: 0.08,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 6, top: 2),
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                3,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: AppColor.mainColor,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: AppColor.primaryColor),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColor.mainColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: AppColor.primaryColor),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width /
                                                  3,
                                          margin: const EdgeInsets.only(
                                            top: 8,
                                            left: 8,
                                          ),
                                          padding: const EdgeInsets.only(
                                              right: 15, bottom: 2),
                                          decoration: BoxDecoration(
                                              // color: Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            '${controller.saveCategory.value.data![index].name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  fontSize: 10,
                                                  color: AppColor.primaryColor,
                                                ),
                                            // overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Container()
                      : const Center(
                          child: CustomLoading(),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
