import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/login/controllers/login_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

import '../../../../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Obx(() => Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const Spacer(),
              CustomTextfield(
                hintText: "phone number",
                onChanged: (value) {
                  controller.checkValidation();
                },
                textEditController: controller.phoneTextEditController.value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintText: "passsword",
                onChanged: (value) {
                  controller.checkValidation();
                },
                textEditController: controller.passwordTextEditController.value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtom(
                title: "Login",
                onTap: () {
                  controller.login();
                },
                disble: controller.disbleBottom.value,
              ),
              const Spacer(),
            ],
          ))),
    );
  }
}
