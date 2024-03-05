import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class ApiBaseHelper extends GetConnect {
  // final dio = Dio();

  static final ApiBaseHelper apiBaseHelper = ApiBaseHelper._internal();
  ApiBaseHelper._internal();
  static ApiBaseHelper get obj => apiBaseHelper;

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
    try {
      switch (methode) {
        case METHODE.get:
          final response = await get(fullUrl, headers: header ?? headerDefault);
          return _returnResponse(response);
        case METHODE.post:
          if (body != null) {
            final response =
                await post(fullUrl, json.encode(body), headers: headerDefault);
            return _returnResponse(response);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));
        case METHODE.delete:
          final response = await delete(fullUrl, headers: headerDefault);
          return _returnResponse(response);
        case METHODE.update:
          if (body != null) {
            final response =
                await put(fullUrl, json.encode(body), headers: headerDefault);
            return _returnResponse(response);
          }
          return Future.error(
              const ErrorModel(bodyString: 'Body must be included'));
        default:
          break;
      }
    } catch (e) {
      debugPrint("On catch api ");
      return Future.error(e);
    }
  }

  dynamic _returnResponse(Response response) {
    debugPrint("staud code ${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        return json.decode(response.bodyString!);
      case 201:
        return json.decode(response.bodyString!);
      case 202:
        return json.decode(response.bodyString!);
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.bodyString!));
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.bodyString!));
      case 401:
        return 3000;
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.bodyString!));
      case 422:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.bodyString!));
      case 500:
        break;
      default:
    }
  }
}
