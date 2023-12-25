import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/home/controllers/home_controller.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    return Container(
      color: AppColor.mainColor,
      child: SafeArea(
        child: Obx(() => Container(
              color: AppColor.backgroundColor,
              child: SizedBox(
                width: double.infinity,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Text("រក្សាទុក",
                        style: Theme.of(context).textTheme.titleLarge!),
                  ),
                  Text(controller.isFocus.value.toString()),
                  // Expanded(
                  //   child: Container(
                  //     margin: const EdgeInsets.only(right: 5, left: 5),
                  //     child: ListView.builder(
                  //       itemCount: 30,
                  //       itemBuilder: (context, i) {
                  //         return QuestionCard(
                  //           ontap: () {},
                  //           questiondata: controller.homeData.value.data![1],
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                ]),
              ),
            )),
      ),
    );
  }
}
