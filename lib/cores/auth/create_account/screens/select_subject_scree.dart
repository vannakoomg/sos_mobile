import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/cores/auth/create_account/controllers/create_account_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';
import 'package:sos_mobile/utils/widgets/custom_square_container.dart';

class SeletctSubjectScreen extends StatelessWidget {
  const SeletctSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(() => Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomAppBar(title: "រើសមុខវិជ្ជាដែលអ្នកចូលចិត្ត"),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 15,
                                    runSpacing: 15,
                                    children: controller.subject.value.data!
                                        .asMap()
                                        .entries
                                        .map((e) {
                                      return GestureDetector(
                                          onTap: () {},
                                          child: DynamicSquareContainer(
                                            colors: controller.color[e.key],
                                            text: e.value.title!,
                                            ontap: () {
                                              if (controller
                                                      .selectedSucject[e.key] !=
                                                  e.key) {
                                                controller.numberSelect.value++;
                                                controller.selectedSucject[
                                                    e.key] = e.key;
                                                controller.selectSubjectSubmit
                                                    .add(e.value.id);
                                              } else {
                                                controller.numberSelect.value--;
                                                controller.selectSubjectSubmit
                                                    .remove(e.value.id);
                                                controller.selectedSucject[
                                                    e.key] = -1;
                                              }
                                            },
                                            select: controller.selectedSucject[
                                                        e.key] ==
                                                    e.key
                                                ? true
                                                : false,
                                          ));
                                    }).toList()),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: CustomButtom(
                                  disble: controller.numberSelect.value > 0
                                      ? false
                                      : true,
                                  title: "យល់ព្រម",
                                  onTap: () {
                                    controller.createAccount();
                                  },
                                  // colors: Theme.of(context).colorScheme.primary,
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (controller.isloading.value)
                const Center(child: CustomLoading())
            ],
          )),
    );
  }
}
