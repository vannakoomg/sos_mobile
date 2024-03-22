import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/login/controllers/login_controller.dart';
import 'package:sos_mobile/cores/walk_though/singin/controller/auth_gmail_service.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_gmail_card.dart';
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
        () => SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("ស្វាគមន៏\nនៃការត្រលប់មកវិញ",
                            style: Theme.of(context).textTheme.titleLarge!),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                          // height: 900,
                          // color: Colors.red,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 30, right: 30, top: 10, bottom: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextfield(
                                high: 60,
                                hintText: "gmail.com",
                                onChanged: (value) {
                                  controller.email.value = value;
                                  controller.loginSuccess.value = true;
                                },
                                textEditController: controller.emailText.value,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextfield(
                                hintText: "ពាក្យសម្ងាត់",
                                onChanged: (value) {
                                  controller.password.value = value;
                                  controller.loginSuccess.value = true;
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
                                          "ពាក្យសម្ងាត់រឺ gamil.com របស់អ្នកមិនត្រូវទេ​, សូមព្យាយាមម្ដងទៀត",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: AppColor.dangerColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    const Gap(10),
                                  ],
                                ),
                              controller.isLoading.value
                                  ? const Center(
                                      child: CustomLoading(),
                                    )
                                  : CustomButtom(
                                      white: double.infinity,
                                      height: 35,
                                      title: "Login",
                                      onTap: () {
                                        unFocus(context);
                                        controller.login().then((value) => {
                                              if (controller.loginSuccess.value)
                                                {
                                                  context.goNamed('/home'),
                                                }
                                            });
                                      },
                                      disble: controller.checkValidation(),
                                    ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8),
                                      child: Text(
                                        "ភ្លេចពាក្យសម្ងាត់",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 0.5,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text("OR"),
                              const Gap(20),
                              CustomGmailCard(
                                ontap: () {
                                  AuthGmailService.obj.signInWithGoogle();
                                },
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
