import 'package:dio/dio.dart';

class MainInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers = {
      'content-type': 'application/json',
//      Constants.RAPID_KEY_HEADER: Constants.RAPID_KEY_VALUE,
    };
    print('Nguyen: Header: ' + options.headers.toString());
    return super.onRequest(options);
  }
}
