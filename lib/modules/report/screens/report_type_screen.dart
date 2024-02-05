import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/modules/report/controllers/report_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_buttom.dart';

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
    return Container(
      // height: MediaQuery.sizeOf(context).height / 2.5,
      padding: const EdgeInsets.only(left: 2, right: 2, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            "REPORT",
            style: Theme.of(context).textTheme.titleMedium!,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: controller.reportType.value.data!.map((e) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    child: Row(children: [
                      Expanded(
                        child: Text(
                          "${e.name}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 20,
                        color: Theme.of(context).colorScheme.onSecondary,
                      )
                    ]),
                  );
                }).toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtom(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  title: "Close",
                  height: 40,
                  onTap: () {
                    context.pop();
                  }),
            ],
          )
        ],
      ),
    );
  }
}
