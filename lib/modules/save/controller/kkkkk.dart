import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/helpers/api_base_helper/api_base_helper.dart';

import '../../../utils/helpers/local_data/storge_local.dart';

Future createCategory({
  File? file,
  String? name,
}) async {
  final token = await LocalStorage.getStringValue(key: 'access_token');
  String fileName = file != null ? file.path.split("/").last : "";
  FormData formData = FormData.fromMap({
    'name': name,
    "cover": file!.path != ""
        ? await MultipartFile.fromFile(file.path, filename: fileName)
        : "",
  });
  try {
    Dio dio = Dio();
    await dio
        .post("http://10.0.2.2:8001/api/v1/save-category",
            data: formData,
            options: Options(headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            }))
        .then((value) {
      debugPrint("done---------------------------");
    });
  } on DioError catch (e) {
    debugPrint("error--------------------------$e-");
  }
}
