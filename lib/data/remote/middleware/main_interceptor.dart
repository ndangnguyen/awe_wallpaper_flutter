import 'package:awe_wallpaper/utils/constants.dart';
import 'package:dio/dio.dart';

class MainInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    options.headers = {
      'Authorization': Constants.ACCESS_KEY,
    };
    print('Nguyen: Header: ' + options.headers.toString());
    return super.onRequest(options);
  }
}
