import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/create_account/controllers/create_account_controller.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

import '../../hello/widgets/paint.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final controller = Get.put(CreateAccountController());

  @override
  void initState() {
    controller.fetchSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Obx(
          () => SizedBox(
            child: Stack(
              children: [
                CustomPaint(
                  painter: Paint07(),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    height: MediaQuery.sizeOf(context).height / 2.6,
                  ),
                ),
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 15),
                    height: MediaQuery.sizeOf(context).width / 1.23,
                    width: MediaQuery.sizeOf(context).width / 1.3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBack(),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "បង្កើតគណនី",
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
                Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextfield(
                        high: 60,
                        hintText: "អាសយដ្ឋាន gmail",
                        onChanged: (value) {
                          controller.gmail.value = value;
                          controller.checkValidation();
                        },
                        textEditController: controller.gmailtext.value,
                      ),
                      const Gap(10),
                      CustomTextfield(
                        high: 60,
                        hintText: "ឈ្មោះ",
                        onChanged: (value) {
                          controller.name.value = value;
                          controller.checkValidation();
                        },
                        textEditController: controller.nametext.value,
                      ),
                      const Gap(10),
                      CustomTextfield(
                        high: 60,
                        hintText: "ពាក្យសម្ងាត់",
                        onChanged: (value) {
                          controller.password.value = value;
                          controller.checkValidation();
                        },
                        textEditController: controller.passwordtext.value,
                      ),
                      const Gap(10),
                      CustomButtom(
                        height: 40,
                        disble: controller.disable.value,
                        title: "យល់ព្រម",
                        onTap: () {
                          unFocus(context);
                          controller.disable.value = true;
                          context.go('/hello/create-account/otp',
                              extra: controller.gmailtext.value.text);
                        },
                      ),
                      const Gap(30)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
