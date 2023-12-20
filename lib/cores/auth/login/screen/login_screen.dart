import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/cores/auth/login/controllers/login_controller.dart';
import 'package:sos_mobile/cores/walk_though/singin/controller/auth_service.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

import '../../../../utils/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = AuthService();
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Obx(
        () => Stack(
          children: [
            CustomPaint(
              painter: Paint02(),
              child: Container(
                height: MediaQuery.sizeOf(context).width * .8,
                width: MediaQuery.sizeOf(context).width * .7,
                padding: const EdgeInsets.only(left: 30, top: 100),
                child: Text(
                  "ស្វាគមន៏នៃការត្រលប់មកវិញ",
                  style: Theme.of(context).textTheme.titleLarge!,
                ),
              ),
            ),
            Container(
                color: Colors.transparent,
                margin: const EdgeInsets.only(left: 30, right: 30, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextfield(
                      high: 60,
                      hintText: "លេខទូរស័ទ្ទ",
                      onChanged: (value) {
                        controller.checkValidation();
                      },
                      textEditController:
                          controller.phoneTextEditController.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      hintText: "លេខសម្ងាង់",
                      onChanged: (value) {
                        controller.checkValidation();
                      },
                      textEditController:
                          controller.passwordTextEditController.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButtom(
                      title: "Login",
                      onTap: () {
                        controller
                            .login()
                            .then((value) => {context.go('/home-screen')});
                      },
                      disble: controller.disbleBottom.value,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 1,
                            color: AppColor.mainColor,
                          )),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("OR"),
                          ),
                          Expanded(
                              child: Container(
                            height: 1,
                            color: AppColor.mainColor,
                          )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            logincontroller.signInWithGoogle();
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: AppColor.secondnaryColor),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.email,
                              color: AppColor.secondnaryColor,
                            )),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.secondnaryColor),
                          ),
                          child: Center(
                              child: Icon(
                            Icons.book,
                            color: AppColor.secondnaryColor,
                          )),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
