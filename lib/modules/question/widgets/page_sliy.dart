import 'package:flutter/material.dart';

import '../../../configs/const/Colors/app_colors.dart';

class PageSliy extends StatelessWidget {
  final Function ontap;
  final bool isAnswer;
  const PageSliy({super.key, required this.ontap, required this.isAnswer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(border: Border.a),
      height: 35,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: GestureDetector(
          onTap: () {
            ontap();
          },
          child: Stack(
            children: [
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
              ),
              AnimatedPositioned(
                top: 2.5,
                left: isAnswer == true ? 2 : 72,
                duration: const Duration(milliseconds: 250),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 30,
                  width: isAnswer == true ? 60 : 45,
                  decoration: BoxDecoration(
                    color: AppColor.secondnaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "1",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.mainColor, fontSize: 11),
                    ),
                    Text(
                      "2",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.mainColor, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
