import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MoviesListEntity>> getCurrentlyMovies();
  Future<List<MoviesListEntity>> getPopularMovies();
  Future<List<MoviesListEntity>> getTopRatedMovies();
  Future<List<MoviesListEntity>> getUpComindMovies();
}

class MoviesRemoteDataSourceImplementation extends MoviesRemoteDataSource {
  final ApiServices apiServices;

  MoviesRemoteDataSourceImplementation({required this.apiServices});
  @override
  Future<List<MoviesListEntity>> getCurrentlyMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/now_playing?');
    List<MoviesListEntity> currentMovies = [];
    for (var element in jsonData["results"]) {
      currentMovies.add(
        MoviesListEntity.fromJson(element),
      );
    }
    return currentMovies;
  }

  @override
  Future<List<MoviesListEntity>> getPopularMovies() async {
    Map<String, dynamic> jsonData = await apiServices.get(endpoin: 'movie/popular?');
    List<MoviesListEntity> popularMovies = [];
    for (var element in jsonData["results"]) {
      popularMovies.add(
        MoviesListEntity.fromJson(element),
      );
    }
    return popularMovies;
  }

  @override
  Future<List<MoviesListEntity>> getTopRatedMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/top_rated?');
    List<MoviesListEntity> topRatedMovies = [];
    for (var element in jsonData["results"]) {
      topRatedMovies.add(
        MoviesListEntity.fromJson(element),
      );
    }
    return topRatedMovies;
  }

  @override
  Future<List<MoviesListEntity>> getUpComindMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/upcoming?');
    List<MoviesListEntity> upcomingMovies = [];
    for (var element in jsonData["results"]) {
      upcomingMovies.add(
        MoviesListEntity.fromJson(element),
      );
    }
    return upcomingMovies;
  }
}
