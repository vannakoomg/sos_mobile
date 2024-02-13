import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/report/screens/report_type_detail_screen.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/models/list_id_name_model.dart';

class ReportController extends GetxController {
  final isloading = true.obs;
  final reportType = ListIdNameModel().obs;
  final reportTypeDetail = ListIdNameModel().obs;
  void ontapReport(
      {required BuildContext context, required String title, required int id}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return ReportTypeDetailScreen(
            title: title,
            id: id,
          );
        }));
  }

  Future fetchReportType() async {
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/report-type",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      reportType.value = ListIdNameModel.fromJson(value);
      debugPrint("report type $value");
      isloading.value = false;
    });
  }

  Future fetchReportTypeDetail(int id) async {
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/report-type/$id",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      reportTypeDetail.value = ListIdNameModel.fromJson(value);
      debugPrint("report type $value");
    });
  }
}
