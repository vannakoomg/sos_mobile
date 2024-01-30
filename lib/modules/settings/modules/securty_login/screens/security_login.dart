import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/modules/settings/widgets/setting_off_on_card.dart';

class SecurityLoginScreen extends StatelessWidget {
  const SecurityLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OffOnSettingCard(
                title: "Two Factor Login",
                subTitle: "On",
                ontap: () {},
                isShow: 0,
                description: 'when you login new device is require Otp',
              ),
              const Gap(10),
              const Text("Reset Password"),
              const Gap(10),
              const Text("Logout")
            ],
          ),
        ),
      ),
    );
  }
}
