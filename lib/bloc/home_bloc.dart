import 'package:awe_wallpaper/data/model/random_response.dart';
import 'package:awe_wallpaper/data/repository.dart';
import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends Bloc {
  final Repository _repository;
  final randomImage = BehaviorSubject<RandomResponse>();

  HomeBloc(this._repository);
  
  getRandomImage() async {
    final response = await _repository.getRandomPhoto();
    randomImage.sink.add(response);
  }

  @override
  void dispose() {
    randomImage.close();
  }
}