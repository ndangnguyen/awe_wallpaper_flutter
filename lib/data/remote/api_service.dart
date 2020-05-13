import 'package:dio/dio.dart';

import 'api_handler.dart';

abstract class ApiService {
  Future<List<String>> getCountries();
}

class ApiServiceImpl with ApiHandler implements ApiService {
  Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<List<String>> getCountries() async {
    List<String> countries = [];
    await callApi(
      call: _dio.get('countries'),
      onSuccess: (response) {
      },
      onError: (error) => {},
    );
    return countries;
  }
}
