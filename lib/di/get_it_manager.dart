import 'package:awe_wallpaper/data/remote/api_service.dart';
import 'package:awe_wallpaper/data/remote/middleware/logging_interceptor.dart';
import 'package:awe_wallpaper/data/remote/middleware/main_interceptor.dart';
import 'package:awe_wallpaper/data/repository.dart';
import 'package:awe_wallpaper/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class GetItManager {
  static final _instance = GetItManager._internal();
  final getIt = GetIt.asNewInstance();

  GetItManager._internal();

  factory GetItManager() => _instance;

  T get<T>() => getIt.get<T>();

  void register() {
    getIt.registerLazySingleton<Dio>(() => provideDio());
    getIt.registerLazySingleton<ApiService>(() => provideApiService(get<Dio>()));
    getIt.registerLazySingleton<Repository>(() => provideRepository(get<ApiService>()));
  }

  Dio provideDio() {
    final options = BaseOptions(
      receiveTimeout: Constants.HTTP_RECEIVE_TIME_OUT,
      connectTimeout: Constants.HTTP_CONNECT_TIME_OUT,
      baseUrl: Constants.BASE_URL,
    );
    return Dio()
      ..options = options
      ..interceptors.add(MainInterceptor())
      ..interceptors.add(LoggingInterceptor());
  }

  ApiService provideApiService(Dio dio) => ApiServiceImpl(dio);

  Repository provideRepository(ApiService apiService) {
    return RepositoryImpl(apiService);
  }
}