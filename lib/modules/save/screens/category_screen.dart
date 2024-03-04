import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_book.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_oops.dart';

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
                    style: Theme.of(context).textTheme.titleMedium!),
                const Gap(20),
                Expanded(
                    child: controller.isloading.value &&
                            controller.saveCategory.value.data == null
                        ? const Center(
                            child: CustomLoading(),
                          )
                        : controller.saveCategory.value.data != null
                            ? Stack(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 30,
                                      ),
                                      itemCount: controller
                                          .saveCategory.value.data!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
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
                                                "id": controller.saveCategory
                                                    .value.data![index].id
                                                    .toString()
                                              },
                                            );
                                          },
                                          child: Center(
                                            child: CustomBook(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 5),
                                              width: MediaQuery.sizeOf(context)
                                                      .width /
                                                  3.5,
                                              height: MediaQuery.sizeOf(context)
                                                      .width /
                                                  2.5,
                                              ontap: () {},
                                              title: controller
                                                      .saveCategory
                                                      .value
                                                      .data![index]
                                                      .name ??
                                                  "",
                                              image: controller
                                                      .saveCategory
                                                      .value
                                                      .data![index]
                                                      .cover ??
                                                  "",
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  if (controller.isloading.value &&
                                      controller.saveCategory.value.data !=
                                          null)
                                    const CustomLoading()
                                ],
                              )
                            : CustomOops(ontap: () {
                                controller.fetchSaveCategory();
                              }))
              ],
            ),
          ),
        ));
  }
}
