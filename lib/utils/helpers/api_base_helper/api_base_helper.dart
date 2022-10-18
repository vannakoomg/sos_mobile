import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:global_configuration/global_configuration.dart';

import '../local_data/local_data.dart';

class ApiBaseHelperGetConnect extends GetConnect {
  final String _baseUrl = GlobalConfiguration().get('api_base_url');
  Future<dynamic> fetchData({
    String? url,
    Map<String, String>? header,
    bool? isAuthorize = false,
  }) async {
    // final token = await LocalData.getCurrentUser();
    const token = '';
    // ignore: prefer_typing_uninitialized_variables
    final responseJson;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (isAuthorize == true && token != '')
        'Authorization': isAuthorize! ? 'Bearer $token' : ""
    };
    try {
      final response = await get(
        _baseUrl + url!,
        headers: header,
      );
      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> putDatafile(
      {required String url,
      required FormData body,
      Map<String, String>? header,
      bool? isAuthorize = false}) async {
    final token = await LocalData.getCurrentUser();
    final fullUrl = _baseUrl + url;
    // ignore: prefer_typing_uninitialized_variables
    final responseJson;
    Map<String, String> header = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      if (isAuthorize == true && token != '')
        'Authorization': isAuthorize! ? 'Bearer $token' : ""
    };
    try {
      // final form = FormData(body);

      var response = await put(
        fullUrl,
        body,
        headers: header,
      );
      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> postData(
      {required String url,
      required Map<dynamic, dynamic> body,
      Map<String, String>? header,
      bool? isAuthorize = false}) async {
    // ignore: prefer_typing_uninitialized_variables
    final responseJson;
    final token = await LocalData.getCurrentUser();
    final fullUrl = _baseUrl + url;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (isAuthorize == true && token != '') 'Authorization': 'Bearer $token'
    };

    try {
      final response = await post(
        fullUrl,
        json.encode(body),
        headers: header,
      );
      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> putData({
    required String url,
    required Map<dynamic, dynamic> body,
    Map<String, String>? header,
    bool? isAuthorize = false,
  }) async {
    // ignore: prefer_typing_uninitialized_variables
    final responseJson;
    final token = await LocalData.getCurrentUser();
    final fullUrl = _baseUrl + url;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (isAuthorize == true && token != '')
        'Authorization': isAuthorize! ? 'Bearer $token' : ""
    };
    try {
      final response = await put(fullUrl, json.encode(body), headers: header);
      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  Future<dynamic> deleteData(
      {required String url,
      Map<String, String>? header,
      bool? isAuthorize = false}) async {
    // ignore: prefer_typing_uninitialized_variables
    final responseJson;
    final token = await LocalData.getCurrentUser();
    final fullUrl =
        isAuthorize == true && token == '' ? '$_baseUrl$url' : _baseUrl + url;
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (isAuthorize == true && token != '')
        'Authorization': isAuthorize! ? 'Bearer $token' : ""
    };

    debugPrint("body $fullUrl ");

    try {
      final response = await delete(fullUrl, headers: header);
      responseJson = _returnResponse(response);
    } catch (e) {
      return Future.error(e);
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.bodyString!);
        return responseJson;
      case 400:
        return Future.error(ErrorModelGetConnect(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 401:
      case 404:
        return Future.error(ErrorModelGetConnect(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 403:
        return Future.error(ErrorModelGetConnect(
            statusCode: response.statusCode,
            bodyString: json.decode(response.bodyString!)));
      case 500:
        return Future.error(ErrorModelGetConnect(
            statusCode: response.statusCode, bodyString: response.bodyString!));

      default:
        return Future.error(ErrorModelGetConnect(
            statusCode: response.statusCode,
            bodyString: response.bodyString ?? 'Error'));
    }
  }
}

class ErrorModelGetConnect {
  final int? statusCode;
  final dynamic bodyString;
  const ErrorModelGetConnect({this.statusCode, this.bodyString});
}

// Future<dynamic> fetchData(
//     {String? url,
//     Map<String, String>? header,
//     bool? isAuthorize = false}) async {
//   // ignore: prefer_typing_uninitialized_variables
//   final _token = await LocalDataStorage.getCurrentUser();
//   // ignore: prefer_typing_uninitialized_variables
//   final responseJson;
//   Map<String, String> _header = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//   };
//   try {
//     final response = await get(_baseUrl + url!, headers: header ?? _header);
//     responseJson = _returnResponse(response);
//   } catch (e) {
//     return Future.error(e);
//   }
//   return responseJson;
// }
// Future<dynamic> putDatafile(
//     {required String url,
//     required FormData body,
//     Map<String, String>? header,
//     bool? isAuthorize = false}) async {
//   final fullUrl = _baseUrl + url;
//   final _token = await LocalDataStorage.getCurrentUser();
//   final _session = await LocalDataStorage.getUserSession();
//   // ignore: prefer_typing_uninitialized_variables
//   final responseJson;
//   Map<String, String> _header = {
//     'Content-Type': 'multipart/form-data',
//     'Accept': 'application/json',
//     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//   };
//   try {
//     // final form = FormData(body);

//     var response = await put(
//       fullUrl,
//       body,
//       headers: _header,
//     );
//     responseJson = _returnResponse(response);
//   } catch (e) {
//     return Future.error(e);
//   }
//   return responseJson;
// }

// Future<dynamic> postData(
//     {required String url,
//     required Map<dynamic, String> body,
//     Map<String, String>? header,
//     bool? isAuthorize = false}) async {
//   final fullUrl = _baseUrl + url;
//   // ignore: prefer_typing_uninitialized_variables
//   final responseJson;
//   // ignore: unused_local_variable
//   final _token = await LocalDataStorage.getCurrentUser();
//   final _session = await LocalDataStorage.getUserSession();
//   Map<String, String> _header = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': isAuthorize! ? 'Bearer $_token' : ""
//   };
//   try {
//     final response =
//         await post(fullUrl, json.encode(body), headers: header ?? _header);
//     responseJson = _returnResponse(response);
//   } catch (e) {
//     return Future.error(e);
//   }
//   return responseJson;
// }

// Future<dynamic> putData({
//   required String url,
//   required Map<dynamic, String> body,
//   Map<String, String>? header,
//   bool? isAuthorize = false,
// }) async {
//   final fullUrl = _baseUrl + url;
//   // ignore: prefer_typing_uninitialized_variables
//   final responseJson;
//   // ignore: unused_local_variable
//   final _token = await LocalDataStorage.getCurrentUser();
//   final _session = await LocalDataStorage.getUserSession();
//   Map<String, String> _header = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': isAuthorize! ? 'Bearer  $_token' : ""
//   };
//   try {
//     final response =
//         await put(fullUrl, json.encode(body), headers: header ?? _header);
//     responseJson = _returnResponse(response);
//   } catch (e) {
//     return Future.error(e);
//   }
//   return responseJson;
// }

// Future<dynamic> deleteData(
//     {required String url,
//     Map<String, String>? header,
//     bool? isAuthorize = false}) async {
//   final fullUrl = _baseUrl + url;
//   // ignore: prefer_typing_uninitialized_variables
//   final responseJson;
//   final _token = await LocalDataStorage.getCurrentUser();
//   final _session = await LocalDataStorage.getUserSession();
//   Map<String, String> _header = {
//     'Content-Type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': isAuthorize! ? 'Bearer  $_token' : ""
//   };
//   try {
//     final response = await delete(fullUrl, headers: header ?? _header);
//     responseJson = _returnResponse(response);
//   } catch (e) {
//     return Future.error(e);
//   }
//   return responseJson;
// }
