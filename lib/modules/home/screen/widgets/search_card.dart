import 'package:flutter/material.dart';

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
        width: MediaQuery.of(context).size.width / 2 - 14,
        margin: const EdgeInsets.only(left: 4, top: 8, right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          // image: DecorationImage(
          //   image: NetworkImage(image),
          // ),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}