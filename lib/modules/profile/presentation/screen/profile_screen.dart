import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                var file = picker.pickMultiImage();
                // final XFile? image =
                //     await picker.pickImage(source: ImageSource.gallery);
                // debugPrint("file $image");
              },
              child: Container(
                margin: const EdgeInsets.only(top: 100),
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.yellow),
              ),
            ),
            const Text(
              "Vannak",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
