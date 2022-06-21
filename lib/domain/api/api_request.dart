import 'dart:async';

import 'package:dio/dio.dart';
import 'package:food/export.dart';

class ApiRequest {
  String requestUrl;

  ApiRequest({
    required this.requestUrl,
  });

  static Dio dio = Dio(
      BaseOptions(baseUrl: Config.baseUrl, responseType: ResponseType.json));

  Future<Response?> postRequest() async {
    Response? response;
    try {
      if (await Utilities.checkIsConnectEstablish()) {
        Utilities.noConnection();
      } else {
        response = await dio.post(requestUrl);
      }
    } on DioError catch (e) {
      response = null;
      error(dioError: e, functionParameter: requestUrl);
    }
    return response;
  }

  Future<Response?> getRequest() async {
    Response? response;
    try {
      if (await Utilities.checkIsConnectEstablish()) {
        Utilities.noConnection();
      } else {
        response = await dio.get(requestUrl);
      }
    } on DioError catch (e) {
      response = null;
      error(dioError: e, functionParameter: requestUrl);
    }
    return response;
  }

  static error(
          {required DioError dioError, required String functionParameter}) =>
      Utilities.debugPrintCustom('$functionParameter ${dioError.response}');
}
