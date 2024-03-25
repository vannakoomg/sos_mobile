import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            child: Column(children: [
              const Spacer(),
              CustomButtom(
                title: "ចូលប្រើ",
                onTap: () {
                  context.goNamed("login-screen");
                },
                white: 160,
              ),
              const Gap(8),
              CustomButtom(
                outline: true,
                title: "បង្កើតគណនី",
                onTap: () {
                  context.goNamed('create-account');
                },
                white: 160,
              ),
              const Gap(30),
            ]),
          ),
        ],
      ),
    );
  }
}
