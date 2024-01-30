import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/create_account/controllers/create_account_controller.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

class SeletctSubjectScreen extends StatelessWidget {
  const SeletctSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(() => SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  child: CustomPaint(
                    painter: Paint05(),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      width: MediaQuery.sizeOf(context).width / 1.4,
                      height: MediaQuery.sizeOf(context).width / 1.5,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: CustomPaint(
                      size: Size(MediaQuery.sizeOf(context).width / 2.5,
                          MediaQuery.sizeOf(context).width / 2.5),
                      painter: Paint06(),
                    )),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("រើសមុខវិជ្ជាដែលអ្នកចូលចិត្ត",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColor.primaryColor)),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                  spacing: 15,
                                  runSpacing: 15,
                                  children: controller.subject.value.data!
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (controller.selectedSucject[e.key] !=
                                            e.key) {
                                          controller.numberSelect.value++;
                                          controller.selectedSucject[e.key] =
                                              e.key;
                                          controller.selectSubjectSubmit
                                              .add(e.value.id);
                                        } else {
                                          controller.numberSelect.value--;
                                          controller.selectSubjectSubmit
                                              .remove(e.value.id);
                                          controller.selectedSucject[e.key] =
                                              -1;
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius: 1.9,
                                                  offset: const Offset(8, 3),
                                                  color:
                                                      controller.selectedSucject[e
                                                                  .key] ==
                                                              e.key
                                                          ? AppColor
                                                              .secondnaryColor
                                                              .withOpacity(0.0)
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .primary
                                                              .withOpacity(0.5),
                                                  blurRadius: 10)
                                            ],
                                            color: controller.selectedSucject[
                                                        e.key] ==
                                                    e.key
                                                ? AppColor.secondnaryColor
                                                : Theme.of(context)
                                                    .colorScheme
                                                    .background,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        height: 45,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              e.value.title!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color:
                                                          AppColor.primaryColor,
                                                      fontSize: 17),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 30),
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
                if (controller.isloading.value)
                  const Center(child: CustomLoading())
              ],
            ),
          )),
    );
  }
}
