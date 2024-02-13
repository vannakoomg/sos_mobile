import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/widgets/change_gmail.dart';
import 'package:sos_mobile/modules/settings/modules/securty_login/widgets/comfirm_logout.dart';
import 'package:sos_mobile/modules/settings/widgets/setting_off_on_card.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

import '../../../../../configs/const/Colors/app_colors.dart';

class SecurityLoginScreen extends StatelessWidget {
  const SecurityLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Securty Login"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OffOnSettingCard(
                      title: "Two Factor Login",
                      ontap: () {},
                      isShow: 0,
                      description: 'when you login new device is require Otp',
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed('block');
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Block",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.textThird),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.goNamed('hide');
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Hide",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.textThird),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          builder: ((context) {
                            return const ComfirmLogout();
                          }),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Reset Password",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.textThird),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: false,
                            builder: ((context) {
                              return const ChangeGmail();
                            }));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        width: double.infinity,
                        color: Colors.transparent,
                        child: Text(
                          "Change Gmail",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.textThird),
                        ),
                      ),
                    ),
                  ]),
            ),
            const Gap(20),
            Container(
              width: double.infinity,
              height: 0.5,
              color: AppColor.textfourth,
            ),
            const Gap(15),
            GestureDetector(
              onTap: () async {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  builder: ((context) {
                    return const ComfirmLogout();
                  }),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "Logout",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColor.textThird),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
