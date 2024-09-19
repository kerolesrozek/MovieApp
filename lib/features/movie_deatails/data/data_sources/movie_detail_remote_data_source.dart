import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_video_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class MovieDetailRemoteDataSource {
  Future<MovieVideoEntity> getMovieVideo({required int movieId});
  Future<List<MoviePersonEntity>> getMoviePerson({required int movieId});
  Future<List<MovieEntity>> getSimellerMovies({required int movieId});
}

class MovieDetailRemoteDataSourceImplementaion
    extends MovieDetailRemoteDataSource {
  final ApiServices apiServices;

  MovieDetailRemoteDataSourceImplementaion({required this.apiServices});

  @override
  Future<MovieVideoEntity> getMovieVideo({required int movieId}) async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/$movieId/videos?');
    MovieVideoEntity movie = MovieVideoEntity.fromJson(jsonData);
    return movie;
  }

  @override
  Future<List<MoviePersonEntity>> getMoviePerson({required int movieId}) async {
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

  @override
  Future<List<MovieEntity>> getSimellerMovies({required int movieId}) async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/$movieId/similar?');

    List<MovieEntity> movies = [];
    for (var element in jsonData["results"]) {
      movies.add(
        MovieEntity.fromJson(
          element,
        ),
      );
    }
    return movies;
  }
}
