import 'package:awe_wallpaper/data/remote/api_service.dart';

abstract class Repository {
  Future<List<String>> getCountries();
}

class RepositoryImpl implements Repository {
  ApiService _apiService;

  RepositoryImpl(this._apiService);

  @override
  Future<List<String>> getCountries() {
    return _apiService.getCountries();
  }
}
