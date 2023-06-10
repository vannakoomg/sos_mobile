import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/home/screen/widgets/search_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 75, left: 8, right: 8),
      height: double.infinity,
      width: double.infinity,
      color: AppColor.mainColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("ពេញនិយម"),
          Wrap(
            children: [
              SearchCrad(
                title: "សំនួរមិនមានអ្នកឆ្លើយ",
                image:
                    "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                ontap: () {},
              ),
              SearchCrad(
                title: "សំនួរមិនមានអ្នកឆ្លើយ",
                image:
                    "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                ontap: () {},
              ),
              SearchCrad(
                title: "សំនួរមិនមានអ្នកឆ្លើយ",
                image:
                    "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                ontap: () {},
              ),
              SearchCrad(
                title: "សំនួរមិនមានអ្នកឆ្លើយ",
                image:
                    "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                ontap: () {},
              ),
              SearchCrad(
                title: "សំនួរមិនមានអ្នកឆ្លើយ",
                image:
                    "https://w0.peakpx.com/wallpaper/143/603/HD-wallpaper-cat-tom-jerry-mouse.jpg",
                ontap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
