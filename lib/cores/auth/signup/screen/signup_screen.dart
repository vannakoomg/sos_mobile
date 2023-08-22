import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/signup/controller/signup_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: AppColor.mainColor,
        body: Obx(
          () => Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                controller.stepsString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              controller.steps.value == 0
                  ? CustomTextfield(
                      hintText: "enter your gmail",
                      onChanged: (value) {
                        controller.onChangedGmail();
                      },
                      textEditController:
                          controller.gmailTextEditController.value,
                      textInputType: TextInputType.emailAddress,
                    )
                  : controller.steps.value == 1
                      ? CustomTextfield(
                          autofocus: true,
                          hintText: "enter your name",
                          onChanged: (value) {
                            controller.onChangedName();
                          },
                          textEditController:
                              controller.nameTextEditController.value,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextfield(
                              autofocus: true,
                              hintText: "enter your password",
                              onChanged: (value) {
                                controller.onChangePassword();
                              },
                              textEditController:
                                  controller.passwordTextEditController.value,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                pause: const Duration(seconds: 8),
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Password a less 6 charater ',
                                    textStyle:
                                        TextStyle(color: AppColor.primaryColor),
                                    cursor: '',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
              const Spacer(),
              CustomButtom(
                disble: controller.disbleBottom.value,
                title: "Next",
                onTap: () {
                  controller.onTapBottomNext();
                },
              ),
            ]),
          ),
        ));
  }
}
