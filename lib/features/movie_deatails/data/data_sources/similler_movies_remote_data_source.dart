import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class SimillerMoviesRemoteDataSource {
  Future<List<MoviesListEntity>> getSimellerMovies({required int movieId});
}

class SimillerMoviesRemoteDataSourceImplementaion
    extends SimillerMoviesRemoteDataSource {
  final ApiServices apiServices;

  SimillerMoviesRemoteDataSourceImplementaion({required this.apiServices});
  @override
  Future<List<MoviesListEntity>> getSimellerMovies(
      {required int movieId}) async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin:'movie/$movieId/similar?');

    List<MoviesListEntity> movies = [];
    for (var element in jsonData["results"]) {
      movies.add(
        MoviesListEntity.fromJson(
          element,
        ),
      );
    }
    return movies;
  }
}
