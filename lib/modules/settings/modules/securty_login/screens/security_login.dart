import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/configs/route/route.dart';
import 'package:sos_mobile/modules/settings/widgets/setting_off_on_card.dart';
import 'package:sos_mobile/utils/helpers/local_data/storge_local.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

class SecurityLoginScreen extends StatelessWidget {
  const SecurityLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Securty Login"),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
              Text(
                "Reset Password",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onTertiary),
              ),
              const Gap(10),
              GestureDetector(
                onTap: () async {
                  await LocalStorage.storeData(key: 'access_token', value: '')
                      .then(
                    (value) {
                      router.goNamed("hello");
                    },
                  );
                },
                child: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
