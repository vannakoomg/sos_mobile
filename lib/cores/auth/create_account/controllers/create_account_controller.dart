import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/route/route.dart';

class CreateAccountController extends GetxController {
  final gmailtext = TextEditingController().obs;
  final nametext = TextEditingController().obs;
  final passwordtext = TextEditingController().obs;
  final isotp = false.obs;
  final isShowOtp = false.obs;
  final isShowForm = true.obs;
  final title = "បង្កើតគណនី".obs;
  final otp = TextEditingController().obs;
  final disable = true.obs;
  void clearValue() {
    gmailtext.value = TextEditingController();
    nametext.value = TextEditingController();
    passwordtext.value = TextEditingController();
    otp.value = TextEditingController();
    isotp.value = false;
    isShowOtp.value = false;
    isShowForm.value = true;
    title.value = "បង្កើតគណនី";
    disable.value = true;
    router.pop();
  }

  void checkValidation() {
    if (gmailtext.value.text == '' ||
        nametext.value.text == '' ||
        passwordtext.value.text == '') {
      disable.value = true;
    } else {
      disable.value = false;
    }
  }

  void ontap() {
    isotp.value = !isotp.value;
    Future.delayed(const Duration(milliseconds: 100), () {
      isShowForm.value = !isShowForm.value;
      Future.delayed(const Duration(milliseconds: 500), () {
        isShowOtp.value = !isShowOtp.value;
        Future.delayed(const Duration(milliseconds: 100), () {
          title.value =
              "Otp ត្រូវផ្ញើរទៅកាន់គណនី [ ${gmailtext.value.text} ]សូមចូលទៅក្នុងប្រអប់សារដើម្បីធ្វើការផ្ទៀងផ្ទត់";
        });
      });
    });
  }

  void onChanged({String value = '', required BuildContext context}) {
    if (value.length == 4) {
      debugPrint("Go to subject ");
      clearValue();
      router.go('/hello/create-account/select-subject');
    }
  }

  void ontapBack() {
    if (isotp.value) {
      isotp.value = !isotp.value;
      Future.delayed(const Duration(milliseconds: 300), () {
        isShowOtp.value = !isShowOtp.value;
        Future.delayed(const Duration(milliseconds: 300), () {
          isShowForm.value = !isShowForm.value;
          Future.delayed(const Duration(milliseconds: 100), () {
            title.value = "បង្កើតគណនី";
          });
        });
      });
    } else {
      debugPrint("pppppp");
      router.pop();
    }
  }

  final subject = [
    "គណិត",
    "រូប",
    "ខ្មែរ",
    "គីមី",
    "ជីវិះ",
    "ផែនដី",
    "ប្រវត្តិសាស្រ្ត",
    "ពលរដ្ឋសីលធម៍",
    "ភាសារ",
  ];
  final numberSelect = 0.obs;
  final selectedSucject = [-1, -1, -1, -1, -1, -1, -1, -1, -1].obs;
  void fetchSubject() {}
}
