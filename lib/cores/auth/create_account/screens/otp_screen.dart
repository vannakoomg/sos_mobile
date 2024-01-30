import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../controllers/create_account_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateAccountController());

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Obx(
          () => Stack(
            children: [
              CustomPaint(
                painter: PaintOtp(),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 2,
                ),
              ),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBack(
                        ontap: () {
                          controller.clearValue();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            "Otp ត្រូវបានផ្ញើទៅកាន់ Gmail ${controller.gmail.value} \n សូមចូលត្រួតពិនិត្យ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColor.primaryColor)),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
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
                    // textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
