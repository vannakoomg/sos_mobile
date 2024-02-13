import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/report/controllers/report_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

class ReportTypeDetailScreen extends StatefulWidget {
  final String title;
  final int id;
  const ReportTypeDetailScreen(
      {super.key, required this.title, required this.id});

  @override
  State<ReportTypeDetailScreen> createState() => _ReportTypeDetailScreenState();
}

class _ReportTypeDetailScreenState extends State<ReportTypeDetailScreen> {
  final controller = Get.put(ReportController());

  @override
  void initState() {
    controller.fetchReportTypeDetail(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: double.infinity,
          padding:
              const EdgeInsets.only(left: 2, right: 2, top: 60, bottom: 20),
          decoration: BoxDecoration(
            color: AppColor.textfourth,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 20, color: AppColor.textThird),
              ),
              Expanded(
                child: controller.isloading.value
                    ? const Center(
                        child: CustomLoading(),
                      )
                    : SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: controller.reportTypeDetail.value.data!
                                .map((e) {
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.transparent,
                                  child: Text(
                                    "${e.name}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
              ),
              CustomButtom(
                  title: "Close",
                  onTap: () {
                    context.pop();
                  })
            ],
          ),
        ));
  }
}