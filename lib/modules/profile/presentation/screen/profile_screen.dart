import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/profile/presentation/logic/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: double.infinity,
          height: double.infinity,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        )),
                  ],
                ),
                GestureDetector(
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.gallery);
                      // _profileController.listImage.clear();
                      // var imagee = await picker.pickMultiImage();
                      // imagee.map((e) {
                      //   _profileController.listImage.add(File(e.path));
                      // }).toList();

                      _profileController.imagePath.value = File(image!.path);
                      debugPrint(
                          "image path ${_profileController.listImage[0]}");
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow,
                        image: _profileController.imagePath.value.path == ''
                            ? null
                            : DecorationImage(
                                image: FileImage(
                                  File(_profileController.imagePath.value.path),
                                ),
                                fit: BoxFit.cover),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "វណ្ណះ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
