import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/controllers/security_login_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class ComfirmOtp extends StatelessWidget {
  const ComfirmOtp({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextfield(
                    autofocus: true,
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
                    borderColor: Theme.of(context).colorScheme.primary,
                    disble: controller.otp.value.length == 4 ? false : true,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
