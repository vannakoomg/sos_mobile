import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class SearchCrad extends StatelessWidget {
  final String title;
  final String image;
  final Function ontap;
  const SearchCrad(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 5),
        width: (MediaQuery.of(context).size.width - 15) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.primaryColor,
          // image: DecorationImage(
          //   image: NetworkImage(image),
          // ),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
      ),
    );
  }
}
