import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/url.dart';

import '../local_data/storge_local.dart';

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModel({this.statusCode, this.bodyString});
}

enum METHODE {
  get,
  post,
  delete,
  put,
  update,
}

class ApiBaseHelper {
  // final dio = Dio();

  final dio = Dio();

  static final ApiBaseHelper apiBaseHelper = ApiBaseHelper._internal();
  ApiBaseHelper._internal();

  // String? baseurl = '';
  Future<dynamic> onNetworkRequesting({
    required String url,
    Map<String, String>? header,
    Map<String, dynamic>? body,
    required METHODE? methode,
    required bool isAuthorize,
    String base = '',
  }) async {
    final token = await LocalStorage.getStringValue(key: 'access_token');
    final fullUrl = base == '' ? baseUrl + url : base + url;

    Map<String, String> headerDefault = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize ? 'Bearer $token' : '',
    };
    switch (methode) {
      case METHODE.get:
        final response = await dio.get(fullUrl,
            options: Options(headers: header ?? headerDefault), data: body);
        return returnResponse(response);
      case METHODE.post:
        final response = await dio.post(fullUrl,
            options: Options(headers: header ?? headerDefault),
            data: body ?? {});
        return returnResponse(response);
      case METHODE.put:
        final response = await dio.put(fullUrl,
            options: Options(headers: header ?? headerDefault),
            data: body ?? {});
        return returnResponse(response);
      case METHODE.delete:
        final response = await dio.delete(fullUrl,
            options: Options(headers: header ?? headerDefault),
            data: body ?? {});
        return returnResponse(response);
      default:
        break;
    }
  }

  dynamic returnResponse(Response response) {
    debugPrint("staud code ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 202:
        return response.data;
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data!));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data!));
      case 401:
        return 3000;
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data!));
      case 422:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data!));
      case 500:
        break;
      default:
    }
  }
}
