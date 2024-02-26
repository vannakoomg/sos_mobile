import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomCommentCrad extends StatelessWidget {
  final String name;
  final String time;
  final String title;
  final Function ontap;
  final Function ontapProfile;
  const CustomCommentCrad({
    super.key,
    required this.name,
    required this.time,
    required this.title,
    required this.ontap,
    required this.ontapProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onTertiary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 0.5),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ontapProfile();
                    },
                    child: Text(name,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColor.secondnaryColor,
                            )),
                  ),
                  const Gap(5),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColor.textfourth, fontSize: 9),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                ontap();
              },
              child: Icon(
                Icons.more_horiz,
                color: AppColor.textfourth,
              ),
            )
          ],
        ),
        Text(
          "$title dslfjldfsakjfksjflsflkdsjljlsjflsjdlfsdkfslkflksjdflksjfsajdflsadjflsjdaflsadjfjslkdafjlksajflsadjfljsdlkjsdaljsadfljdsalkjadsfljdsaljadslfjsalfjadsljsfljs;ldsfjlksdfjlksjlsdfjlsdfjlsjfl;sdfjdsjfkjdsfjsdlfjsldkfjlskdjs",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColor.textThird),
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ]),
    );
  }
}
