import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Stack(
          children: [
            Positioned(
              child: CustomPaint(
                painter: Paint01(),
                child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 50),
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  height: MediaQuery.sizeOf(context).width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("សួស្ដី",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColor.primaryColor)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(children: [
                const Spacer(),
                CustomButtom(
                    title: "Login",
                    onTap: () {
                      context.go('/hello/login-screen');
                    }),
                const SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  title: "Create Account",
                  onTap: () {
                    context.go('/hello/create-account');
                  },
                  colors: Colors.white,
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
