import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_entity.dart';

abstract class MovieVideoRemoteDataSource {
  Future<MovieVideoEntity> getMovieVideo({required int movieId});
}

class MovieVideoRemoteDataSourceImplementaion
    extends MovieVideoRemoteDataSource {
  final ApiServices apiServices;

  MovieVideoRemoteDataSourceImplementaion({required this.apiServices});

  @override
  Future<MovieVideoEntity> getMovieVideo({required int movieId}) async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/$movieId/videos?');
    MovieVideoEntity movie = MovieVideoEntity.fromJson(jsonData);
    return movie;
  }
}
