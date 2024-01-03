import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/controller/profile_infomation_controller.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/widgets/profile_info_card.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final controller = Get.put(ProfileInfoController());

  @override
  void initState() {
    controller.fetchSubject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          backgroundColor: AppColor.backgroundColor,
          centerTitle: true,
        ),
        body: Obx(() => Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              color: AppColor.backgroundColor,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://i.pinimg.com/564x/11/6e/0f/116e0f3bdb1a2d509154526ec07b3ab0.jpg",
                      fit: BoxFit.fill,
                      imageBuilder: (context, imageProvider) => Container(
                        height: MediaQuery.sizeOf(context).width / 3,
                        width: MediaQuery.sizeOf(context).width / 3,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.secondnaryColor, width: 3),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  ProfileInfoCard(
                    maxlength: 30,
                    title: TextEditingController(text: "Bio"),
                    onChanged: (value) {
                      debugPrint("value $value");
                    },
                  ),
                  const Gap(10),
                  ProfileInfoCard(
                    maxlength: 30,
                    title: TextEditingController(text: "vannak"),
                    onChanged: (value) {
                      debugPrint("value $value");
                    },
                  ),
                  const Gap(10),
                  ProfileInfoCard(
                    maxlength: 30,
                    title: TextEditingController(text: "vannak123"),
                    onChanged: (value) {
                      debugPrint("value $value");
                    },
                  ),
                  const Gap(10),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      children: controller.subject.value.data!
                          .asMap()
                          .entries
                          .map((e) {
                        return GestureDetector(
                          onTap: () {
                            if (controller.selectedSucject[e.key] != e.key) {
                              // controller.numberSelect.value++;
                              controller.selectedSucject[e.key] = e.key;
                              controller.selectSubjectSubmit.add(e.value.id);
                            } else {
                              // controller.numberSelect.value--;
                              controller.selectSubjectSubmit.remove(e.value.id);
                              controller.selectedSucject[e.key] = -1;
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color:
                                    controller.selectedSucject[e.key] == e.key
                                        ? AppColor.secondnaryColor
                                        : AppColor.mainColor,
                                borderRadius: BorderRadius.circular(50)),
                            height: 30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.value.title!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColor.primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                ],
              ),
            )));
  }
}
