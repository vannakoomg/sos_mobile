import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/create_account/controllers/create_account_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Obx(
          () => SizedBox(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  top: controller.isotp.value
                      ? -MediaQuery.sizeOf(context).height
                      : -MediaQuery.sizeOf(context).height / 2,
                  left: controller.isotp.value
                      ? -MediaQuery.sizeOf(context).height
                      : -MediaQuery.sizeOf(context).height / 2,
                  child: AnimatedContainer(
                    width: controller.isotp.value
                        ? MediaQuery.sizeOf(context).height * 2
                        : MediaQuery.sizeOf(context).height - 90,
                    height: controller.isotp.value
                        ? MediaQuery.sizeOf(context).height * 2.3
                        : MediaQuery.sizeOf(context).height - 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondnaryColor,
                    ),
                    curve: Curves.ease,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50, left: 15),
                  height: MediaQuery.sizeOf(context).width / 1.23,
                  width: MediaQuery.sizeOf(context).width / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBack(
                        ontap: () {
                          unFocus(context);
                          controller.ontapBack();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          controller.title.value,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: controller.isShowForm.value ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomTextfield(
                                high: 60,
                                hintText: "Gmail",
                                onChanged: (value) {
                                  controller.checkValidation();
                                },
                                textEditController: controller.gmailtext.value,
                              ),
                              const Gap(10),
                              CustomTextfield(
                                high: 60,
                                hintText: "ឈ្នះ",
                                onChanged: (value) {
                                  controller.checkValidation();
                                },
                                textEditController: controller.nametext.value,
                              ),
                              const Gap(10),
                              CustomTextfield(
                                high: 60,
                                hintText: "ពាក្យសម្ងាត់",
                                onChanged: (value) {
                                  controller.checkValidation();
                                },
                                textEditController:
                                    controller.passwordtext.value,
                              ),
                            ],
                          ),
                        ),
                        CustomButtom(
                          disble: controller.disable.value,
                          title: "យល់ព្រម",
                          onTap: () {
                            unFocus(context).then((value) {
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                controller.ontap();
                              });
                            });
                          },
                        ),
                        const Gap(10)
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: controller.isShowOtp.value ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: SizedBox(
                      width: 150,
                      child: CustomTextfield(
                        hintText: "Otp",
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          controller.onChanged(value: value, context: context);
                        },
                        textInputType: TextInputType.number,
                        textEditController: controller.otp.value,
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
