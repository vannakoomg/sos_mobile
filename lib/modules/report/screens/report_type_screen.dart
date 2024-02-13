import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/modules/report/controllers/report_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';
import 'package:sos_mobile/utils/widgets/custom_loading.dart';

class ReportTypeScreen extends StatefulWidget {
  const ReportTypeScreen({super.key});

  @override
  State<ReportTypeScreen> createState() => _ReportTypeScreenState();
}

class _ReportTypeScreenState extends State<ReportTypeScreen> {
  final controller = Get.put(ReportController());

  @override
  void initState() {
    controller.fetchReportType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 300,
          padding:
              const EdgeInsets.only(left: 2, right: 2, top: 20, bottom: 20),
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
                "REPORT",
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
                        child: Column(
                          children: controller.reportType.value.data!.map((e) {
                            return GestureDetector(
                              onTap: () {
                                controller.ontapReport(
                                    context: context,
                                    title: e.name ?? "",
                                    id: e.id ?? 0);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                color: Colors.transparent,
                                child: Row(children: [
                                  Expanded(
                                    child: Text(
                                      "${e.name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    size: 20,
                                    color: AppColor.textThird,
                                  )
                                ]),
                              ),
                            );
                          }).toList(),
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