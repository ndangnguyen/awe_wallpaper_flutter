import 'package:awe_wallpaper/data/model/random_response.dart';
import 'package:dio/dio.dart';

import 'api_handler.dart';

abstract class ApiService {
  Future<RandomResponse> getRandomPhoto();
}

class ApiServiceImpl with ApiHandler implements ApiService {
  Dio _dio;

  ApiServiceImpl(this._dio);

  @override
  Future<RandomResponse> getRandomPhoto() async {
    RandomResponse randomPicture;
    await callApi(
      call: _dio.get('photos/random'),
      onSuccess: (response) {
        randomPicture = RandomResponse.fromJson(response);
      },
      onError: (error) => {},
    );
    return randomPicture;
  }
}
