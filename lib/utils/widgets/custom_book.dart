import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

class CustomBook extends StatelessWidget {
  final String title;
  final Function ontap;
  final String image;
  final double height;
  final double width;
  final double size;
  final EdgeInsets padding;
  final Color? color;
  const CustomBook({
    super.key,
    this.padding = const EdgeInsets.only(left: 12, top: 4),
    this.title = "",
    this.size = 3,
    required this.ontap,
    this.image = "",
    required this.height,
    this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: 0.12,
          child: Container(
            margin: const EdgeInsets.only(left: 12, top: 4),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: color ?? Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ),
        Transform.rotate(
          angle: 0.08,
          child: Container(
            margin: const EdgeInsets.only(left: 6, top: 2),
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: color ?? Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColor.mainColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: color ?? Theme.of(context).colorScheme.onSecondary),
          ),
          child: image != ''
              ? CustomCachedImageCircle(
                  image: image,
                  borderRadius: BorderRadius.circular(5),
                )
              : const SizedBox(),
        ),
        Container(
          width: width,
          height: height,
          margin: padding,
          padding: const EdgeInsets.only(right: 15, bottom: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: size == 3 ? 10 : 6,
                  color: AppColor.primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
