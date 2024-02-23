import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/cores/auth/hello/widgets/paint.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Positioned(
            child: CustomPaint(
              painter: Paint01(),
              child: Container(
                padding: const EdgeInsets.only(left: 15, top: 10),
                width: MediaQuery.sizeOf(context).width * 0.7,
                height: MediaQuery.sizeOf(context).width * 0.9,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: Text("សួស្ដីមកកាន់នាង​សីតា",
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
          ),
          SizedBox(
            width: double.infinity,
            // padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(children: [
              const Spacer(),
              CustomButtom(
                title: "Login",
                onTap: () {
                  context.goNamed("login-screen");
                },
                white: 160,
              ),
              const Gap(8),
              CustomButtom(
                title: "Create Account",
                onTap: () {
                  context.goNamed('create-account');
                },
                white: 160,
                colors: Colors.transparent,
                borderColor: Colors.white,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          "ភ្លេចពាក្យសម្ងាត់",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 0.5,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
        ],
      ),
    );
  }
}
