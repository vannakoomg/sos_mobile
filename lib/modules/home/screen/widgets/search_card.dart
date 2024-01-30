import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class PopularCard extends StatelessWidget {
  final String title;
  final String image;
  final Function ontap;
  const PopularCard(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.bottomRight,
        height: 10,
        padding: const EdgeInsets.only(bottom: 5, right: 5),
        // margin: const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.primaryColor),
          ),
        ),
      ),
    );
  }
}
