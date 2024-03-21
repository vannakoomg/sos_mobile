import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_gmail_card.dart';

import '../../../../configs/const/Colors/app_colors.dart';
import '../../../walk_though/singin/controller/auth_gmail_service.dart';

class CustomVerifyGmail extends StatelessWidget {
  final bool isClose;
  final String title;
  final String descrition;
  final String name;
  const CustomVerifyGmail({
    super.key,
    this.isClose = false,
    this.title = "សូមស្វាគមន៏",
    this.descrition = "ភ្ជាប់ជាមួយ Google ដើម្បី​ Login",
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "",
        isClose: isClose,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(5),
              Text(
                descrition,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Gap(30),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: AppColor.secondnaryColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 30,
                ),
              ),
              const Gap(2),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
              ),
              const Gap(30),
              CustomGmailCard(ontap: () {
                AuthGmailService.obj.signInWithGoogle();
              }),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
