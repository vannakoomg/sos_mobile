import 'package:flutter/material.dart';

class PrivacyDataCrad extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function ontap;
  final bool isTrue;
  final String description;
  const PrivacyDataCrad({
    super.key,
    required this.title,
    required this.subTitle,
    required this.ontap,
    required this.isTrue,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white.withOpacity(0.9)),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                ontap();
              },
              child: SizedBox(
                // color: Colors.white,
                height: 40,
                width: 80,
                // color: Colors.white,
                child: Stack(
                  children: [
                    Center(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.9),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 5, bottom: 5),
                              child: Text(subTitle),
                            ))),
                    if (isTrue)
                      Center(
                        child: Transform(
                          transform: Matrix4.identity()..rotateZ(2.5),
                          alignment: Alignment.center,
                          child: Container(
                            height: 2,
                            width: 60,
                            color: Colors.red.withOpacity(0.8),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white.withOpacity(0.5)),
              ),
            ),
            const SizedBox(
              width: 100,
            )
          ],
        )
      ],
    );
  }
}
