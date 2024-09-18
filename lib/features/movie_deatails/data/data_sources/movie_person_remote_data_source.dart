import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';

abstract class MoviePersonRemoteDataSource {
  Future<List<MoviePersonEntity>> getMoviePerson({required int movieId});
}

class MoviePersonRemoteDataSourceImple extends MoviePersonRemoteDataSource {
  final ApiServices apiServices;

  MoviePersonRemoteDataSourceImple({required this.apiServices});
  @override
  Future<List<MoviePersonEntity>> getMoviePerson(
      {required int movieId}) async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/$movieId/credits?');

    List<MoviePersonEntity> person = [];
    for (var element in jsonData["cast"]) {
      person.add(
        MoviePersonEntity.formJson(
          element,
        ),
      );
    }
    return person;
  }
}
