import 'package:flutter/material.dart';

class CustomTagCard extends StatelessWidget {
  final String title;
  final Function ontap;
  final bool isOnSearch;
  const CustomTagCard(
      {super.key,
      required this.title,
      this.isOnSearch = true,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isOnSearch == true) {
          ontap();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5, bottom: 5),
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
        decoration: BoxDecoration(
            color: const Color(0xffa9def9),
            borderRadius: BorderRadius.circular(20)),
        child: isOnSearch == true
            ? Text(
                title,
                style: const TextStyle(fontSize: 11),
              )
            : Wrap(children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 11),
                ),
                GestureDetector(
                  onTap: () {
                    ontap();
                  },
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.close,
                      weight: 500,
                      size: 12,
                    ),
                  ),
                )
              ]),
      ),
    );
  }
}
