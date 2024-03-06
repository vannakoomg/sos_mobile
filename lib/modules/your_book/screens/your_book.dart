import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final controller = Get.put(CategoryController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Theme.of(context).colorScheme.background,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).height,
            child: SafeArea(
              child: Column(
                children: [
                  Text("រក្សាទុក",
                      style: Theme.of(context).textTheme.titleLarge!),
                  const Gap(10),
                  Expanded(
                    child: !controller.isloading.value
                        ? GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount:
                                controller.saveCategory.value.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    '${controller.saveCategory.value.data![index].name}',
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: CustomLoading(),
                          ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
