import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/cores/auth/create_account/controllers/create_account_controller.dart';
import 'package:sos_mobile/cores/walk_though/singin/controller/auth_gmail_service.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_gmail_card.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

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
    return Obx(() => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomBack(),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("បង្កើតគណនី",
                              style: Theme.of(context).textTheme.titleLarge!),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            white: double.infinity,
                            height: 35,
                            disble: controller.disable.value,
                            title: "យល់ព្រម",
                            onTap: () {
                              unFocus(context);
                              // controller.disable.value = true;
                              context.goNamed(
                                'verify-gmail',
                                extra: controller.gmailtext.value.text,
                              );
                            },
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 8),
                                child: Text(
                                  "ឬ",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          CustomGmailCard(ontap: () {
                            AuthGmailService.obj
                                .signInWithGoogle()
                                .then((value) {
                              User user = value;
                              debugPrint("value ${user.email}");
                            }).onError((error, stackTrace) {
                              debugPrint("onerror :   $error");
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
