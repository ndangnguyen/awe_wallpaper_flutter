import 'package:awe_wallpaper/data/model/random_response.dart';
import 'package:awe_wallpaper/data/remote/api_service.dart';

abstract class Repository {
  Future<RandomResponse> getRandomPhoto();
}

class RepositoryImpl implements Repository {
  ApiService _apiService;

  RepositoryImpl(this._apiService);

  @override
  Future<RandomResponse> getRandomPhoto() {
    return _apiService.getRandomPhoto();
  }
}
