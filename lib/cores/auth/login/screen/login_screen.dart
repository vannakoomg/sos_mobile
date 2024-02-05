import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/cores/auth/login/controllers/login_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

import '../../../../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => Stack(
          children: [
            CustomPaint(
              painter: Paint05(),
              child: SafeArea(
                child: Container(
                  height: MediaQuery.sizeOf(context).width * .88,
                  width: MediaQuery.sizeOf(context).width * .98,
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "ស្វាគមន៏\nនៃការត្រលប់មកវិញ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 30, right: 30, top: 100, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    CustomTextfield(
                      high: 60,
                      hintText: "Gmail.com",
                      onChanged: (value) {
                        controller.checkValidation();
                      },
                      textEditController: controller.emailText.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      hintText: "ពាក្យសម្ងាត់",
                      onChanged: (value) {
                        controller.checkValidation();
                      },
                      textEditController:
                          controller.passwordTextEditController.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!controller.loginSuccess.value &&
                        !controller.isLoading.value)
                      Column(
                        children: [
                          Row(
                            children: [
                              const Gap(15),
                              Text(
                                "ពាក្យសម្ងាត់រឺ gamil.com របស់អ្នកមិនត្រូវទេ",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          const Gap(10),
                        ],
                      ),

                    CustomButtom(
                      height: 40,
                      title: "Login",
                      onTap: () {
                        unFocus(context);
                        controller.login().then((value) => {
                              if (controller.loginSuccess.value)
                                {
                                  context.go('/home'),
                                }
                            });
                      },
                      disble: controller.checkValidation(),
                    ),

                    // const Gap(20),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 5, right: 5),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //           child: Container(
                    //         height: 1,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       )),
                    //       const Padding(
                    //         padding: EdgeInsets.all(8.0),
                    //         child: Text("OR"),
                    //       ),
                    //       Expanded(
                    //           child: Container(
                    //         height: 1,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       )),
                    //     ],
                    //   ),
                    // ),
                    // const Gap(10),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     GestureDetector(
                    //       onTap: () {
                    //         logincontroller.signInWithGoogle();
                    //       },
                    //       child: Container(
                    //         height: 45,
                    //         width: 45,
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           border: Border.all(color: Theme.of(context).colorScheme.primary),
                    //         ),
                    //         child: Center(
                    //             child: Icon(
                    //           Icons.email,
                    //           color: Theme.of(context).colorScheme.primary,
                    //         )),
                    //       ),
                    //     ),
                    //     const Gap(10),
                    //     Container(
                    //       height: 45,
                    //       width: 45,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(color: Theme.of(context).colorScheme.primary),
                    //       ),
                    //       child: Center(
                    //           child: Icon(
                    //         Icons.book,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       )),
                    //     ),
                    //   ],
                    // ),
                  ],
                )),
            if (controller.isLoading.value)
              const Center(
                child: CustomLoading(),
              )
          ],
        ),
      ),
    );
  }
}
