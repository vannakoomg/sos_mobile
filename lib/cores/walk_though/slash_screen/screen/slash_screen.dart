import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
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
    Future.delayed(const Duration(milliseconds: 600), () {
      if (token != '') {
        context.go('/home');
      } else {
        Get.toNamed('login-screen');
      }
    });
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ទឹកឡើងមនុស្សសុីត្រីទឹកស្រក់មនុស្សនៅតែសុីត្រីដដែល",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
