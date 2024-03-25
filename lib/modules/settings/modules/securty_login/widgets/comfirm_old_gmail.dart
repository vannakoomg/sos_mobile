import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/controllers/security_login_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../../../../../utils/widgets/custom_app_bar_widget.dart';

class ComfirmOldGmail extends StatelessWidget {
  const ComfirmOldGmail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecurityLoginController());

    PageController pageController =
        PageController(initialPage: controller.indexChangeGmail.value);
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();

    FocusNode focusNode3 = FocusNode();

    return Obx(() => Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onTertiary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(), // Disable swipe

            onPageChanged: (value) {
              controller.indexChangeGmail.value = value;
            },
            controller: pageController,
            children: [
              Column(
                children: [
                  CustomAppBarWidget(
                    title: "gmail ចាស់",
                    ontap: () {
                      context.pop();
                    },
                  ),
                  const Gap(20),
                  CustomTextfield(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    hintText: "Enter Your old Gmail",
                    color: Colors.transparent,
                    onChanged: (value) {
                      controller.gmail.value = value;
                    },
                    textEditController: controller.gmailText.value,
                  ),
                  const Gap(20),
                  CustomButtom(
                    disble: !checkStringIsgmail(value: controller.gmail.value),
                    title: "យល់ព្រម",
                    onTap: () {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                      focusNode1.requestFocus();
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  CustomAppBarWidget(
                    title: "OTP",
                    isClose: true,
                    ontap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  CustomTextfield(
                    focusNode: focusNode1,
                    textAlign: TextAlign.center,
                    hintText: "Comfirm Otp",
                    color: Colors.transparent,
                    onChanged: (value) {
                      controller.otp.value = value;
                    },
                    textEditController: controller.otpText.value,
                  ),
                  CustomButtom(
                    title: "យល់ព្រម",
                    onTap: () {},
                    disble: controller.otp.value.length == 4 ? false : true,
                  ),
                  const Gap(10),
                ],
              ),
              Column(
                children: [
                  CustomAppBarWidget(
                    title: "gmail ថ្មី",
                    isClose: true,
                    ontap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  CustomTextfield(
                    focusNode: focusNode2,
                    textAlign: TextAlign.center,
                    hintText: "enter your new gmail",
                    color: Colors.transparent,
                    onChanged: (value) {
                      controller.otp.value = value;
                    },
                    textEditController: controller.otpText.value,
                  ),
                  CustomButtom(
                    title: "យល់ព្រម",
                    onTap: () {},
                    disble: controller.otp.value.length == 4 ? false : true,
                  ),
                  const Gap(10),
                ],
              ),
              Column(
                children: [
                  CustomAppBarWidget(
                    title: "OTP",
                    isClose: true,
                    ontap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  CustomTextfield(
                    focusNode: focusNode3,
                    textAlign: TextAlign.center,
                    hintText: "Comfirm Otp",
                    color: Colors.transparent,
                    onChanged: (value) {
                      controller.otp.value = value;
                    },
                    textEditController: controller.otpText.value,
                  ),
                  CustomButtom(
                    title: "យល់ព្រម",
                    onTap: () {},
                    disble: controller.otp.value.length == 4 ? false : true,
                  ),
                  const Gap(10),
                ],
              ),
            ],
          ),
        ));
  }
}
