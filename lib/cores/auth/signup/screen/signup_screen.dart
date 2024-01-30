import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/cores/auth/signup/controller/signup_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
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
