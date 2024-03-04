import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/controller/profile_infomation_controller.dart';
import 'package:sos_mobile/modules/settings/modules/profile_information/widgets/profile_info_card.dart';
import 'package:sos_mobile/utils/helpers/fuction.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

import '../../../../../utils/widgets/custom_square_container.dart';

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
        appBar: const CustomAppBar(
          title: "Profile",
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(
                child: CustomLoading(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://i.pinimg.com/564x/11/6e/0f/116e0f3bdb1a2d509154526ec07b3ab0.jpg",
                          fit: BoxFit.fill,
                          imageBuilder: (context, imageProvider) => Container(
                            height: MediaQuery.sizeOf(context).width / 3.5,
                            width: MediaQuery.sizeOf(context).width / 3.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 0.5),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      ProfileInfoCard(
                        maxlength: 30,
                        hintText: "Enter Bio",
                        title: TextEditingController(text: "Bio"),
                        onChanged: (value) {
                          debugPrint("value $value");
                        },
                      ),
                      const Gap(10),
                      ProfileInfoCard(
                        hintText: "Enter Name",
                        maxlength: 30,
                        title: TextEditingController(text: "vannak"),
                        onChanged: (value) {
                          debugPrint("value $value");
                        },
                      ),
                      const Gap(10),
                      ProfileInfoCard(
                        hintText: "Enter Bio",
                        maxlength: 30,
                        title: TextEditingController(text: "vannak123"),
                        onChanged: (value) {
                          debugPrint("value $value");
                        },
                      ),
                      const Gap(10),
                      Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 8,
                          runSpacing: 8,
                          children: controller.subject.value.data!
                              .asMap()
                              .entries
                              .map((e) {
                            return GestureDetector(
                                onTap: () {
                                  if (controller.selectedSucject[e.key] !=
                                      e.key) {
                                    controller.selectedSucject[e.key] = e.key;
                                    controller.selectSubjectSubmit
                                        .add(e.value.id);
                                  } else {
                                    controller.selectSubjectSubmit
                                        .remove(e.value.id);
                                    controller.selectedSucject[e.key] = -1;
                                  }
                                },
                                child: DynamicSquareContainer(
                                  colors: rendomColors(),
                                  text: e.value.title!,
                                  ontap: () {
                                    if (controller.selectedSucject[e.key] !=
                                        e.key) {
                                      controller.selectedSucject[e.key] = e.key;
                                      controller.selectSubjectSubmit
                                          .add(e.value.id);
                                    } else {
                                      controller.selectSubjectSubmit
                                          .remove(e.value.id);
                                      controller.selectedSucject[e.key] = -1;
                                    }
                                  },
                                  select:
                                      controller.selectedSucject[e.key] == e.key
                                          ? true
                                          : false,
                                ));
                          }).toList()),
                    ],
                  ),
                ),
              )));
  }
}
