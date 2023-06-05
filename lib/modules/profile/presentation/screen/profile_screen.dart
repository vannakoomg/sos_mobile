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
      backgroundColor: AppColor.mainColor,
      body: SizedBox(
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
                    // var image =
                    //     await picker.pickImage(source: ImageSource.gallery);
                    // _profileController.listImage.clear();
                    var imagee = await picker.pickMultiImage();
                    // imagee.map((e) {
                    //   _profileController.listImage.add(File(e.path));
                    // }).toList();

                    _profileController.imagePath.value = File(imagee[0].path);
                    // debugPrint(
                    //     "image path ${_profileController.listImage[0]}");
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
                height: 20,
              ),
              Text(
                "ដារ៉ា",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Expanded(
                    child: Center(
                        child: Text(
                      "3",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    )),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "23",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    )),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "43",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    )),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "4",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.black),
                    )),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "ចំណូនចិត្ត",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Container(
                    height: 20,
                    color: Colors.blue,
                    width: 60,
                  ),
                  const Spacer(),
                  Text(
                    "1 point",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "30 anwser",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "50%",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                ]),
              ),
              const SizedBox(
                height: 0.5,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Container(
                    height: 20,
                    color: Colors.blue,
                    width: 60,
                  ),
                  const Spacer(),
                  Text(
                    "1 point",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "30 anwser",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "50%",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "សំនួរ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ហេតុអ្វីបានជាទុំស្រលាញ់ទាវ ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  Text(
                    "១២ ៣ ២០០២",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                ]),
              ),
              const SizedBox(
                height: 0.5,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Row(children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "ហេតុអ្វីបានជាទុំស្រលាញ់ទាវ ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  Text(
                    "១២ ៣ ២០០២",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
