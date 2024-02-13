import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

import '../../../../../configs/route/route.dart';
import '../../../../../utils/helpers/local_data/storge_local.dart';

class ComfirmLogout extends StatelessWidget {
  const ComfirmLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      alignment: Alignment.center,
      height: 180,
      decoration: BoxDecoration(
        color: AppColor.textfourth,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Do You Went To Logout ?",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 18, color: AppColor.textThird),
          ),
          const Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CustomButtom(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              colors: AppColor.dangerColor,
              title: "No",
              onTap: () {
                context.pop();
              },
            ),
            CustomButtom(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                title: "Yes",
                colors: AppColor.successColor,
                onTap: () async {
                  await LocalStorage.storeData(key: 'access_token', value: '')
                      .then(
                    (value) {
                      router.goNamed("hello");
                    },
                  );
                })
          ]),
          const Spacer(),
        ],
      ),
    );
  }
}
