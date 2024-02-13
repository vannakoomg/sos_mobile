import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImageCircle extends StatelessWidget {
  final String image;
  final double height;
  final BorderRadius? borderRadius;
  final double width;
  const CustomCachedImageCircle({
    super.key,
    required this.image,
    this.borderRadius,
    this.height = 40,
    this.width = 40,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(400),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      height: height,
      width: width,
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}