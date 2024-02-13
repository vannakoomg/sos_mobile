import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/controllers/security_login_controller.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/widgets/comfirm_otp.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class ChangeGmail extends StatelessWidget {
  const ChangeGmail({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SecurityLoginController());
    return Obx(() => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                color: AppColor.textfourth,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  CustomTextfield(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    hintText: "Enter Your New Gmail",
                    color: Colors.transparent,
                    onChanged: (value) {
                      controller.gmail.value = value;
                    },
                    textEditController: controller.gmailText.value,
                  ),
                  const Spacer(),
                  CustomButtom(
                    borderColor: AppColor.textThird,
                    disble: !checkStringIsgmail(value: controller.gmail.value),
                    title: "យល់ព្រម",
                    onTap: () {
                      context.pop();
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          builder: ((context) {
                            return const ComfirmOtp();
                          }));
                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ));
  }
}
