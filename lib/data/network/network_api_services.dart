import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:barber_app/data/app_exceptions.dart';
import 'package:barber_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url, Map<String, String> headers) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(
      var data, String url, Map<String, String> headers) async {
    if (kDebugMode) {
      print(url);
      print(data);
      print(headers);
    }

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              body: data,
              headers:
                  headers) //if data is in Raw form then encode it , if in formdata then simple data
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }
}
