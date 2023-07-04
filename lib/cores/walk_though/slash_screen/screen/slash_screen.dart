import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({super.key});

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  void getToken() async {
    String token = await LocalStorage.getStringValue(key: "access_token");
    if (token != '') {
      Get.toNamed('login-screen');
    } else {
      Get.toNamed('login-screen');
    }
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: Container(
          height: 40,
          width: 40,
          color: Colors.pink,
        ),
      ),
    );
  }
}
