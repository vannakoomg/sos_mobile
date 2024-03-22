import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

import '../controllers/create_account_controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? time;
  final controller = Get.put(CreateAccountController());

  @override
  void initState() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (controller.time.value > 0) {
        controller.time.value = controller.time.value - 1;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Theme.of(context).textTheme.titleMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.secondnaryColor),
      ),
    );
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const CustomAppBar(
            title: "",
          ),
          body: Obx(
            () => Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "បញ្ជាក់ OTP",
                          style: Theme.of(context).textTheme.titleLarge!,
                        ),
                        const Gap(10),
                        Text(
                          "បញ្ជូល OTP ដែលបានផ្ញើទៅកាន់​ ${controller.gmail.value} របស់អ្នក",
                          style: Theme.of(context).textTheme.bodyLarge!,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(20),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            autofocus: true,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) =>
                                const SizedBox(width: 8),
                            validator: (value) {
                              debugPrint("validator otp");
                              context.pushNamed('select-subject');
                              return null;
                              // return value == '2222' ? null : 'Pin is incorrect';
                            },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            isCursorAnimationEnabled: false,
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: AppColor.successColor,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: AppColor.secondnaryColor,
                                ),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: AppColor.secondnaryColor),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                        const Gap(20),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "មិនបានទទួល OTP? ",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.time.value == 0) {
                            controller.time.value = 60;
                          }
                        },
                        child: Text(
                          controller.time.value == 0
                              ? "ផ្ញើរម្ដងទៀត"
                              : "${formatToKhmer("${controller.time.value}")} វិនាទី",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: AppColor.secondnaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20)
                ],
              ),
            ),
          )),
    );
  }
}
