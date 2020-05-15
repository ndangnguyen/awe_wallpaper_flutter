import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

typedef OnSuccess = void Function(Map response);
typedef OnError = void Function(String error);

class ApiHandler {
  Future callApi({@required Future<Response> call, @required OnSuccess onSuccess, OnError onError}) async {
    try {
      Response response = await call;
      onSuccess(response.data);
    } catch (error, stacktrace) {
//      onError?.call(handleError(error));
      print("Exception occurred: $error stackTrace: $stacktrace");
//      print(handleError(error));
    }
  }

  String handleError(DioError dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription = "Received invalid status code: ${dioError.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
    return 'API Error: ' + errorDescription;
  }
}
