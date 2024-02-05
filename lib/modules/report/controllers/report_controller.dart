import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';
import 'package:sos_mobile/utils/models/list_id_name_model.dart';

class ReportController extends GetxController {
  final reportType = ListIdNameModel().obs;
  final reportTypeDetail = ListIdNameModel().obs;
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
    });
  }

  Future fetchReportTypeDetail() async {
    ApiBaseHelper.apiBaseHelper
        .onNetworkRequesting(
      url: "/v1/report-type",
      methode: METHODE.get,
      isAuthorize: true,
    )
        .then((value) {
      reportTypeDetail.value = ListIdNameModel.fromJson(value);
      debugPrint("report type $value");
    });
  }
}
