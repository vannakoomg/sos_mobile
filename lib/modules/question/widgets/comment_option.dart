import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/report/screens/report_type_screen.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

class CommentOption extends StatelessWidget {
  const CommentOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      decoration: BoxDecoration(
        color: AppColor.textfourth,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        Text(
          "Option",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColor.textThird, fontSize: 18),
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: false,
                      builder: ((context) {
                        return const ReportTypeScreen();
                      }));
                },
                child: Container(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  width: double.infinity,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("Report",
                            style: Theme.of(context).textTheme.titleMedium!),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                        color: AppColor.textThird,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                width: double.infinity,
                color: Colors.transparent,
                child: Text(
                  "Block User",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        CustomButtom(
          height: 40,
          title: "Close",
          onTap: () {
            context.pop();
          },
        )
      ]),
    );
  }
}
